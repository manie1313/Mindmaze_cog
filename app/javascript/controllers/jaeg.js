document.addEventListener("turbo:load", function() {
  const startLink = document.getElementById("start-link");
  const scream = document.getElementById("eren-scream");

  scream.volume = 0.5;

  startLink.addEventListener(
    "click",
    (event) =>
      {
    event.preventDefault();
    console.log("YAREEEEEEEEEEEEEEDAZEEEEEEEEEE");

    scream.currentTime = 0;
    scream.play()
      .then(() => {
        setTimeout(() => {
          window.location.href = startLink.href;
        }, 5000);
      }
    )
  }
)
;
}
)
;
