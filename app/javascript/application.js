// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
// function findInkwell(target) {
//     let loopCheck = 0;
//     while (!target.parentElement.classList.contains("inkwell")) {
//         target = target.parentElement;
//         if (loopCheck > 6 ){
//             console.log(target);
//             break;
//         }
//     }
//     return target.parentElement;
// }
// function buttonSetup(){
//     removeColorButtons = Array.from(document.getElementsByClassName("delete-color-button"));
// }
// let removeColorButtons;
// buttonSetup();
// const addColorButton = document.getElementById("add-color-button");
// addColorButton.addEventListener('click', buttonSetup);
// removeColorButtons.forEach(btn => {
//     btn.addEventListener('click', (e) => {
//         const colorControl = findInkwell(e.target);
//         colorControl.style.display = "none";
//     })
// });
// })