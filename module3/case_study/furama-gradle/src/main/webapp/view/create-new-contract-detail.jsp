<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/4/2020
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

    <style>
        body, html {
            height: 100%;
            background-repeat: no-repeat;
            font-family: 'Lato', Verdana;
        }

        .main {
            margin-top: 70px;
        }

        .form-group {
            margin-bottom: 15px;
        }


        input,
        input::-webkit-input-placeholder {
            font-size: 11px;
            padding-top: 3px;
        }

        .main-login {
            background-color: #9fcdff;
            /* shadows and rounded borders */
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

        }

        label {
            margin-bottom: 15px;
            font-size: 18px;
        }

        .main-center {
            margin-top: 30px;
            margin: 0 auto;
            max-width: 750px;
            padding: 40px 40px;

        }

        .login-button {
            margin-top: 5px;
        }

        .login-register {
            font-size: 12px;
            text-align: center;
            text-decoration: underline;
            color: #5CB85C;
            font-weight: bold;
        }

        .iconbk {
            background-color: #D9534F;
        }

        .list {
            text-align: center;
        }

        .list a {
            color: red;
        }

        .message {
            text-align: center;
            color: orangered;
        }
    </style>
    <title>Create New Contract Detail</title>
</head>

<body>

<div class="container">
    <div class="row main">
        <div class="panel-heading">
            <div class="panel-title text-center">
                <h1 class="title">Create New Contract Detail</h1>
                <hr/>
            </div>
        </div>
        <p class="list">
            <a href="/furama?actionFurama=home">Home</a>
        </p>
        <h3 class="message">${message}</h3>
        <div class="main-login main-center">
            <form class="form-horizontal" method="post" action="/contractDetail">
                <input type="hidden" name="actionFurama" value="createNewContractDetail" />

                <div class="form-group">
                    <label for="quantity" class="cols-sm-2 control-label">Quantity : </label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon iconbk"><i class="fa fa-user-plus fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="quantity" id="quantity"
                                   value="${contractDetail.quantity}" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="idContract" class="cols-sm-2 control-label">ID Contract : </label>
                    <select name="idContract" id="idContract" required>
                        <c:forEach var="idContract" items="${idContracts}">
                            <c:choose>
                                <c:when test="${idContract.id.equals(contractDetail.idContract)}">
                                    <option value="<c:out value='${idContract.id}'/>" selected>
                                        <c:out value="${idContract.id}"></c:out>
                                    </option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${idContract.id}">${idContract.id}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="attachService" class="cols-sm-2 control-label">Attach Service : </label>
                    <select name="attachService" id="attachService" required>
                        <c:forEach var="attachService" items="${attachServices}">
                            <c:choose>
                                <c:when test="${attachService.id.equals(contractDetail.idAttachService)}">
                                    <option value="<c:out value='${attachService.id}'/>" selected>
                                        <c:out value="${attachService.name}"></c:out>
                                    </option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${attachService.id}">${attachService.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-danger btn-lg btn-block login-button">Create New</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>