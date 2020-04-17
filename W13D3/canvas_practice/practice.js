document.addEventListener("DOMContentLoaded", function(){
    const canvasEl = document.getElementById("mycanvas");
    canvasEl.width=500;
    canvasEl.height=500;
    const ctx=canvasEl.getContext("2d");
    ctx.fillStyle='red'
    ctx.fillRect(0,0,500,500)
    ctx.beginPath()
});
