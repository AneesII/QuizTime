
	<marquee><img style="margin-left:10%" src="pics/B3.jpg" width=40% height=100px alt="Image" /></marquee>
	
	<div class="Profile" style="margin-top:8px">
	
	<img src="pics/profileIcon.jpg" width="6%" height="4%" onclick="showProfileInfo()" />
	
	<div id="Inf" onmouseleave="hideProfileInfo()" style="display:none;position:absolute;top:32%;right:1%;text-align:center;background-color:white" >
	
	<%
	
	if(request.getSession().getAttribute("Name")!=null){
		String nm = (String) request.getSession().getAttribute("Name");
		out.print("<h1>");
		out.print(nm);
		out.print("</h1>");
		
	}
	
	%>
	
	<a href="logout.jsp" ><button> Logout </button></a>
	
	</div>
	
	</div>
	
	<script type=text/JavaScript >
	
	function showProfileInfo(){
		document.getElementById("Inf").style.display = "block";
	}
	function hideProfileInfo(){
		document.getElementById("Inf").style.display = "none";
	}
	
	</script>