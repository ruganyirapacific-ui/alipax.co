const body=document.body;
const theme=document.getElementById('theme');
const menu=document.getElementById('hamburger');
const links=document.getElementById('navlinks');
if(localStorage.getItem('alipax-theme')==='dark'){body.classList.add('dark');theme.textContent='☀';}
theme.addEventListener('click',()=>{body.classList.toggle('dark');const dark=body.classList.contains('dark');theme.textContent=dark?'☀':'☾';theme.setAttribute('aria-label',dark?'Activer le mode clair':'Activer le mode sombre');localStorage.setItem('alipax-theme',dark?'dark':'light');});
menu.addEventListener('click',()=>links.classList.toggle('open'));
links.querySelectorAll('a').forEach(a=>a.addEventListener('click',()=>links.classList.remove('open')));
document.getElementById('year').textContent=new Date().getFullYear();
