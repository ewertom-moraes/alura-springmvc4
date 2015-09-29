<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de contas</title>
<script src="resources/js/jquery.js"></script>
<script type="text/javascript">
	function pagaAgora(id) {
		$.get("pagaConta?id="+id, deuCerto);
	}
	function deuCerto(dadosDaResposta) {
	  alert("Conta paga com sucesso!");
	}
</script>

</head>
<body>
	
	<table style="height: 10px; width: 775px;" border="1">
        <tr>
	        <th>Código</th>
	        <th>Descrição</th>
	        <th>Valor</th>
	        <th>Tipo</th>
	        <th>Paga?</th>
	        <th>Data de pagamento</th>
	        <th>Deletar</th>
	        <th>Pagar</th>
        </tr>
		
		<c:forEach items="${contas}" var="conta">
			<tr>
				<td>${conta.id}</td>
				<td>${conta.descricao}</td>
				<td>${conta.valor}</td>
				<td>${conta.tipo}</td>
				<td>
					<c:if test="${conta.paga eq false}">
						Nao paga!
					</c:if>
					<c:if test="${conta.paga eq true}">
						Paga!
					</c:if>
				</td>
				<td>
					<fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy"/> 
				</td>
				<td>
                    <a href="removeConta?id=${conta.id}">Deletar</a> | 
                    <a href="#" onclick="pagaAgora(${conta.id});">Pagar</a>
                </td>
			</tr>
		</c:forEach>
		
	</table>

</body>
</html>