class GameDescritionJob < ApplicationJob
  queue_as :default

  # def perform(*args)
  def perform
    # Do something later
    puts "I'm starting the game_description job"
    sleep 3
    puts "OK I'm done now"
  end
end
