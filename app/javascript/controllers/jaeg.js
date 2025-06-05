// document.addEventListener("turbo:load", function() {
//   const startLink = document.getElementById("start-link");
//   const scream = document.getElementById("eren-scream");

//   // scream.volume = 0.1;

//   startLink.addEventListener(
//     "click",
//     (event) =>
//       {
//     event.preventDefault();
//     console.log("YAREEEEEEEEEEEEEEDAZEEEEEEEEEE");

//     // scream.currentTime = 1;
//     scream.play()
//       .then(() => {
//         setTimeout(() => {
//           window.location.href = startLink.href;
//         }, 3000);
//       }
//     )
//   }
// )
// ;
// }
// )
// ;
document.addEventListener("turbo:load", function () {
  const startLink = document.getElementById("start-link");
  const scream = document.getElementById("eren-scream");

  if (!startLink || !scream) return; // ← avoids the error if not present

  startLink.addEventListener("click", (event) => {
    event.preventDefault();
    console.log("YAREEEEEEEEEEEEEEDAZEEEEEEEEEE");

    scream.play().then(() => {
      setTimeout(() => {
        window.location.href = startLink.href;
      }, 3000);
    });
  });
});
