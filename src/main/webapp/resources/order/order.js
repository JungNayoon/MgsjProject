	function deleteOrder(orderNum) {
		var deleteYN = confirm("주문을 취소할까요?");
		
		if(deleteYN == true) {
			$.ajax({
				url : '/order/orderDelete',
				type : 'POST',
				data : {
					orderNum : orderNum
				},
				success : function(data) {
					alert("주문이 취소되었습니다.");
					location.href = '/order/orderList'
				},
				
				error : function(error) {
					alert("알 수 없는 오류 발생하였습니다.\n 잠시 후에 다시 시도해주세요.");
				}
				
			});
		} else {
			alert("주문 취소가 취소되었습니다.");
		}
	}