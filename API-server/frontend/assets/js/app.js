// Global vars

const uName = document.getElementById("uname")
const uPass = document.getElementById("pass")
const logInBtn = document.getElementById("loginBtn")



const pubUrl = "http://103.73.226.60:8000/data/config.json"; 
const locUrl = "http://127.0.0.1:5500/data/config.json"

loginBtn.onclick = checkInput; 

function checkInput(){
    let _uName, _uPass; 
    if(uName.value != "" && uPass.value != ""){
        _uName = uName.value; 
        _uPass = uPass.value; 
    }else{
        showSnackbar(); 
    }

    authorize(_uName, _uPass)

    
}

function authorize(_uName, _uPass){
    if(_uName == 'user1' || _uName == 'user2' || _uName == 'user3'){
        if(_uPass == 'user1pass' || _uPass == 'user2pass' || _uPass == 'user3pass'){
            window.location = 'dashboard.html'
        }else{
            Toast("Wrong password", 2000, 'danger'); 
        }
    }else{
        Toast("Wrong username", 2000, 'danger'); 
    }

    fetch(locUrl).then((res)=>{
        console.log(res)       
    }).catch(e=> console.log(e)); 



}













// SnackBar
function showSnackbar() {
    var x = document.getElementById("snackbar");
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}





/*
This funciton creates a toast with given params
*/
function Toast(message, time, toastType = null) {

    if (document.getElementById("toast_container")) {
        let div = document.getElementById("toast_container")
        let ul = document.getElementById("toast_list")
        let li = document.createElement("li")
        li.innerText = message
        ul.appendChild(li)
        div.appendChild(ul)

        applyStylre(div, li)

        setInterval(() => {
            div.remove()
        }, time)
    } else {
        let div = document.createElement("div")
        div.setAttribute("id", "toast_container")
        let ul = document.createElement("ul")
        ul.setAttribute("id", "toast_list")
        let li = document.createElement("li")
        li.innerText = message
        ul.appendChild(li)
        div.appendChild(ul)


        document.body.appendChild(div)


        applyStylre(div, li)
        setInterval(() => {
            div.remove()
        }, time)
    }



    function applyStylre(div, msgElem) {
        // userPreferance
        let toastBG, toastContent
        switch (toastType) {
            case "warning":
                toastBG = "yellow"
                toastContent = "black"
                break;
            case "danger":
                toastBG = "red"
                toastContent = "white"
                break;
            default:
                toastBG = "rgb(46, 150, 46)"
                toastContent = "white"
                break;
        }
        // Toast msg style 
        msgElem.style.backgroundColor = toastBG
        msgElem.style.color = toastContent
        msgElem.style.margin = "4px 0"
        msgElem.style.borderRadius = "5px"
        msgElem.style.width = "inherit"
        msgElem.style.padding = "8px 14px 8px 14px"
        // Toast container style

        div.style.position = "fixed"
        div.style.fontSize = "small"
        div.style.top = "10vh"
        div.style.letterSpacing = "2px"
        div.style.right = "10px"
        div.style.padding = "8px 14px 8px 14px"
        div.style.height = "90vh"
        div.style.overflowX = "scroll"
        div.style.scrollbarWidth = "none"
    }


}