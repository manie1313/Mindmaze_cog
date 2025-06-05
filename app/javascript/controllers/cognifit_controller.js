import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    console.log("✅ Stimulus Cognifit controller connected");
  }

  launch() {
    const clientId = this.element.dataset.clientId
    const accessToken = this.element.dataset.accessToken

    if (!window.CognifitSdk || !window.CognifitSdk.CognifitSdk) {
      console.error("CogniFit SDK not loaded. Make sure the script tag is in your layout.")
      return
    }

    const sdk = new window.CognifitSdk.CognifitSdk({
      containerId: this.containerTarget.id,
      clientId,
      cognifitUserAccessToken: accessToken,
      sandbox: false,
      appType: "web",
      theme: "light",
      showResults: true,
      isFullscreenEnabled: true,
      listenEvents: true,
      scale: 100
    })

    sdk.init()
      .then(() => {
        sdk.start("GAME", "BEE_BALLOON").subscribe({
          next: (response) => {
            if (response.isSessionCompleted()) {
              console.log("🎉 Game completed!")
            } else if (response.isSessionAborted()) {
              console.log(" Game aborted.")
            }
          },
          error: (err) => {
            console.error(" Session error:", err)
          }
        })
      })
      .catch((err) => {
        console.error(" SDK init failed:", err)
      })
  }
}

// KEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEP
// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   static targets = ["container"]

//   connect() {
//     console.log(" Stimulus Cognifit controller connected")
//   }

//   launch() {
//     const clientId = this.element.dataset.cognifitClientId
//     const accessToken = this.element.dataset.cognifitAccessToken

//     if (!window.CognifitSdk || !window.CognifitSdk.CognifitSdk) {
//       console.error("CogniFit SDK not loaded. Ensure the script tag is in your layout.")
//       return
//     }

//     const sdk = new window.CognifitSdk.CognifitSdk({
//       containerId: this.containerTarget.id,
//       clientId,
//       cognifitUserAccessToken: accessToken,
//       sandbox: true,
//       appType: "web",
//       theme: "light",
//       showResults: true,
//       isFullscreenEnabled: true,
//       listenEvents: true,
//       scale: 100
//     })

//     document.getElementById("loading-spinner").style.display = "block"

//     sdk.init()
//       .then(() => {
//         document.getElementById("loading-spinner").style.display = "none"

//         sdk.start("GAME", "BEE_BALLOON").subscribe({
//           next: (response) => {
//             if (response.isSessionCompleted()) {
//               console.log("🎉 Game completed!")
//             } else if (response.isSessionAborted()) {
//               console.warn("⚠️ Game aborted.")
//             }
//           },
//           error: (err) => {
//             console.error("❌ Session error:", err)
//           }
//         })
//       })
//       .catch((err) => {
//         document.getElementById("loading-spinner").style.display = "none"
//         console.error("❌ SDK init failed:", err)
//       })
//   }
// }

// REMOVEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

// import { Controller } from "@hotwired/stimulus";
// import { CognifitSdk, CognifitSdkConfig } from '@cognifit/launcher-js-sdk';

// export default class extends Controller {
//   static targets = ["container"];
//   static values = {
//     clientId: String,
//     type: String,  // 'GAME', 'ASSESSMENT', or 'TRAINING'
//     key: String,   // Specific game/assessment key
//     hash: String   // Your client hash
//   };

//   async launch() {
//     try {
//       // Get token using all credentials
//       const userToken = await this.fetchUserToken();

//       const config = new CognifitSdkConfig(
//         this.containerTarget.id,
//         this.clientIdValue,
//         userToken,
//         {
//           sandbox: false,
//           appType: 'web',
//           theme: 'light'
//         }
//       );

//       const cognifitSdk = new CognifitSdk();
//       await cognifitSdk.init(config);

//       cognifitSdk.start(this.typeValue, this.keyValue).subscribe({
//         // ... (keep your existing subscription logic)
//       });

//     } catch (error) {
//       console.error("CogniFit error:", error);
//     }
//   }

//   async fetchUserToken() {
//     // Use all .env credentials to generate token
//     const response = await fetch('/cognifit/token', {
//       method: 'POST',
//       headers: {
//         'Content-Type': 'application/json',
//         'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
//       },
//       body: JSON.stringify({
//         client_id: this.clientIdValue,
//         client_secret: this.hashValue // Using hash from .env
//       })
//     });

//     if (!response.ok) throw new Error("Token fetch failed");
//     return (await response.json()).token;
//   }
// }



// =======================================================================================================

// import { Controller } from "@hotwired/stimulus"
// import { CognifitSdk } from '@cognifit/launcher-js-sdk'
// import { CognifitSdkConfig } from '@cognifit/launcher-js-sdk/lib/lib/cognifit.sdk.config'

// export default class extends Controller {
//   static targets = ["launchButton", "container"]

//   connect() {
//     console.log("CogniFit controller loaded")
//   }

//   async launch(event) {
//     event.preventDefault()

//     const userToken = "yourUserToken" // Replace with dynamic or test token

//     const res = await fetch("/cognifit/get_access_token", {
//       method: "POST",
//       headers: { "Content-Type": "application/json" },
//       body: JSON.stringify({ user_token: userToken })
//     })

//     const data = await res.json()
//     const accessToken = data.access_token
//     const clientId = import.meta.env.VITE_COGNIFIT_CLIENT_ID || "<%= ENV['COGNIFIT_CLIENT_ID'] %>"

//     const config = new CognifitSdkConfig(
//       this.containerTarget.id,
//       clientId,
//       accessToken,
//       {
//         sandbox: false,
//         appType: 'web',
//         theme: 'light',
//         showResults: true
//       }
//     )

//     const sdk = new CognifitSdk()
//     sdk.init(config).then(() => {
//       sdk.start('GAME', 'BEE_BALLOON').subscribe({
//         next: (res) => {
//           if (res.isSessionCompleted()) alert("Game finished!")
//         },
//         error: (err) => {
//           console.error("CogniFit error:", err)
//         }
//       })
//     }).catch(err => {
//       console.error("SDK init failed", err)
//     })
//   }
// }
