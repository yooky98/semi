<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

 <!-- Latest compiled and minified CSS -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
       <!-- jQuery library -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       <!-- Popper JS -->
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
       <!-- Latest compiled JavaScript -->
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
       
 <style>
        .carttTble { 
                background-color: rgb(239, 240, 227); 
                    width: 100%;
                    height: 100%;
        }
        .container{
                 padding: auto;
        }
        #btn-color1{
                  border-color: rgb(224, 224, 224);
                 background-color: rgb(224, 224, 224);
       }
       #btn-color2{
                  border-color: rgb(158, 164, 107);
                 background-color: rgb(158, 164, 107);
       }
    </style>
    
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	
	<div class="contain">
    <h2>장바구니<span class="badge badge-pill badge-primary">1</span></h2>
    <p>* 5만원이상 무료배송</p>  
    <table class="carttTble">
        <thead>
          <tr>
            <th scope="col" colspan="2" ><input type="checkbox" id="allCheck" name="allcheck">상품</th>
            <th scope="col">수량</th>
            <th>숲</th>
            <th scope="col">배송비</th>
            <th scope="col">금액</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="checkbox">img</td>
            <td>행복을 주는 청페페</td>
            <td><span class="plus">+</span><input type="number"><span class="minus">-</span></td>
            <td>숲이름</td>
            <td>2500</td>
            <td>3000<input type="button" id="btn_delete" value="삭제"></td>
          </tr>
          <tr>
            <td><input type="checkbox">img</td>
            <td>공기청정기 ,아디안텀</td>
            <td><span class="plus">+</span><input type="text"><span class="minus">-</span></td>
            <td>숲이름</td>
            <td>2500</td>
            <td>3000<input type="button" id="btn_delete" value="삭제"></td>
          </tr>
        </tbody>
      </table>
    <body>
    <form class="form-horizontal float-right ">
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-8 control-label">상품가격</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail3" >
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-8 control-label">배송비</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="inputPassword3" >
          </div>
        </div>
        <hr>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-8 control-label">결제 예상금액</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" >
            </div>
          </div>
        <div class="form-group" >
          <div class="col-sm-offset-2 col-sm-12">
            <button type="submit" id="btn-color1" >계속 쇼핑하기</button>
            <button type="submit" id="btn-color2">주문하기</button>
          </div>
        </div>
      </form>
    </div>


</body>
</html>


