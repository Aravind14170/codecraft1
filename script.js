function addtask()
{
    const taskinput = document.getElementById("taskinput");
    const tasktext = taskinput.value.trim();

    if(tasktext === "")return;

    const tasklist=document.getElementById("tasklist");
    const li=document.createElement("li");
    const span=document.createElement("span");
    span.textContent=tasktext;

    const actions=document.createElement("div");
    actions.className="actions";

    const donebtn=document.createElement("button");
    donebtn.textContent="Done";
    donebtn.onclick=()=>{
        li.classList.toggle("done");

    };

    const deletebtn=document.createElement("button");
    deletebtn.textContent="Del";
    deletebtn.onclick=()=>{
        tasklist.removeChild(li);
    };

    actions.appendChild(donebtn);
    actions.appendChild(deletebtn);

    li.appendChild(span);
    li.appendChild(actions);
    tasklist.appendChild(li);
    taskinput.value="";

}
