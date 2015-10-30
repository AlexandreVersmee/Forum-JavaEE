
<div class="pagination-centered">
	<ul class="pagination">
		<!-- <li class="arrow unavailable"><a href="">&laquo;</a></li> -->

		<c:forEach var="i" begin="0" end="${NumberTotalOfElement / NumberElementByPage}">
			<c:choose>
				<c:when test="${i == currentPage}">
					<li class="current"><a href="?page=${i}&size=${NumberElementByPage}"><c:out value="${i+1}"/></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="?page=${i}&size=${NumberElementByPage}"><c:out value="${i+1}"/></a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- <li class="current"><a href="?page=0&size=1">1</a></li>
    <li><a href="?page=1&size=1">2</a></li>
    <li><a href="?page=2&size=1">3</a></li>
    <li><a href="">4</a></li>
    
    <li class="unavailable"><a href="">&hellip;</a></li>
    <li><a href="">12</a></li>
    <li><a href="">13</a></li>
    <li class="arrow"><a href="">&raquo;</a></li> -->
	</ul>
</div>