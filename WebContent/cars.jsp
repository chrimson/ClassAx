<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<jsp:include page="/listcars" />

<table id="cars">
	<tr>
		<c:forEach begin="0" end="${fn:length(specNames) - 1}" var="index">
		<td onclick="sort(${index})" class="header">
			<span><c:out value="${specNames[index]}"/></span>
		</td>
		</c:forEach>
	</tr>

	<c:forEach var="car" items="${cars}">
	<tr>
		<c:forEach begin="0" end="${fn:length(car.specs) - 1}" var="index">
		<td onclick="hide(${index})">
			<span style="white-space:nowrap"><c:out value="${car.specs[index]}"/></span>
		</td>
		</c:forEach>
	</tr>
	</c:forEach>

	<tr>
		<c:forEach var="specName" items="${specNames}">
		<td class="search">
			<span><input type="text" style="width:40px"/></span>
		</td>
		</c:forEach>
	</tr>
</table>

<script type="text/javascript">
function sort(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("cars");
  switching = true;

  dir = "asc"; 

  while (switching) {
    switching = false;
    rows = table.getElementsByTagName("tr");

    for (i = 1; i < (rows.length - 2); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName("td")[n];
      y = rows[i + 1].getElementsByTagName("td")[n];

      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          shouldSwitch= true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          shouldSwitch= true;
          break;
        }
      }
    }

    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      switchcount ++;      
    } else {
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}

function hide(n) {
	var table, rows, i, cell, content;
	table = document.getElementById("cars");

	rows = table.getElementsByTagName("tr");
	for (i = 0; i < rows.length; i++) {
		cell = rows[i].getElementsByTagName("td")[n];
		content = cell.firstElementChild;
		
		if (cell.style.maxWidth == "10px") {
			content.style.visibility = "visible";
			cell.style.maxWidth = "200px";
		} else {
			content.style.visibility = "collapse";
			cell.style.maxWidth = "10px";
		}
	}
}

function sizer() {
	var searchboxes, i;
	searchboxes = document.getElementsByClassName("search");
	for (i = 0; i < searchboxes.length; i++) {
		searchboxes[i].firstElementChild.firstElementChild.style.width =
			searchboxes[i].clientWidth + "px";
	}
}
</script>