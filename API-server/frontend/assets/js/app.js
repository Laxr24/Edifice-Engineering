// Global vars

const uName = document.getElementById("uname")
const uPass = document.getElementById("pass")
const logInBtn = document.getElementById("loginBtn")


loginBtn.onclick = ()=>{
    if(uName.value != "" && uPass.value != ""){
        alert(uName.value + " " + uPass.value); 
    }else{
        alert("Nothing there")
    }
}