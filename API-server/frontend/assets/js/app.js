// Global vars

const uName = document.getElementById("uname")
const uPass = document.getElementById("pass")
const logInBtn = document.getElementById("loginBtn")


loginBtn.onclick = ()=>{
    let _uName, _uPass; 

    if(uName.value != "" && uPass.value != ""){
        _uName = uName.value; 
        _uPass = uPass.value; 
    }else{
        alert("You are not authorized :( ")
    }

    if(_uName == 'shaan' && _uPass == 'shan'){
        window.location = 'dashboard.html'
}
}