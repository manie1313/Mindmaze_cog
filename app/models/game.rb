class Game < ApplicationRecord
  after_save :set_content, if: -> { saved_change_to_name? || saved_change_to_category? || saved_change_to_description? }

  has_many :performances, dependent: :destroy
  # has_many :users, through: :performances
  belongs_to :goal
  validates :mode, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :embed_link, presence: true
  validates :description, presence: true

  def content
    if super.blank?
      set_content
    else
      super
    end
  end

  def set_content
    client = OpenAI::Client.new
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [{
          role: "user", content: "Give me an infomative yet brief #{description} for the
           game's #{name} and #{category}.Give me only the text of the recipe, without any of your own answer like 'Here is a simple recipe'."
        }]
      })
    new_content = chatgpt_response["choices"][0]["message"]["content"]
    update(content: new_content)
    return new_content
  end
end
