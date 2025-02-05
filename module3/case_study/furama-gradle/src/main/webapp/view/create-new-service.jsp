<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/2/2020
  Time: 11:11 AM
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
    <title>Create New Service</title>
</head>

<body>

<div class="container">
    <div class="row main">
        <div class="panel-heading">
            <div class="panel-title text-center">
                <h1 class="title">Create New Service</h1>
                <hr/>
            </div>
        </div>
        <p class="list">
            <a href="/furama?actionFurama=home">Home</a>
        </p>
        <h3 class="message">${message}</h3>
        <div class="main-login main-center">
            <form class="form-horizontal" method="post" action="/service">
                <input type="hidden" name="actionFurama" value="createNewService"/>

                <div class="form-group">
                    <label for="id" class="cols-sm-2 control-label">ID:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon iconbk"><i class="fa fa-user-plus fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="id" id="id"
                                   value="${service.id}" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="cols-sm-2 control-label">Name:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon iconbk"><i class="fa fa-user-plus fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="name" id="name"
                                   value="${service.name}" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="area" class="cols-sm-2 control-label">Area:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon iconbk"><i class="fa fa-user-plus fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="area" id="area"
                                   value="${service.area}" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="cost" class="cols-sm-2 control-label">Cost:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon iconbk"><i class="fa fa-user-plus fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="cost" id="cost"
                                   value="${service.cost}" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="maxPeople" class="cols-sm-2 control-label">Max People:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon iconbk"><i class="fa fa-user-plus fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="maxPeople" id="maxPeople"
                                   value="${service.maxPeople}" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="rentTypeId" class="cols-sm-2 control-label">Rent Type : </label>
                    <select name="rentTypeId" id="rentTypeId" required>
                        <c:forEach var="rentType" items="${rentTypes}">
                            <c:choose>
                                <c:when test="${rentType.id.equals(service.rentTypeId)}">
                                    <option value="<c:out value='${rentType.id}'/>" selected><c:out value="${rentType.name}"></c:out></option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${rentType.id}">${rentType.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="serviceTypeId" class="cols-sm-2 control-label">Service Type : </label>
                    <select name="serviceTypeId" id="serviceTypeId" required>
                        <c:forEach var="serviceType" items="${serviceTypes}">
                            <c:choose>
                                <c:when test="${serviceType.id.equals(service.serviceTypeId)}">
                                    <option value="<c:out value='${serviceType.id}'/>" selected><c:out value="${serviceType.name}"></c:out></option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${serviceType.id}">${serviceType.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="standardRoom" class="cols-sm-2 control-label">Standard Room:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon iconbk"><i class="fa fa-envelope-o fa"
                                                                      aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="standardRoom" id="standardRoom"
                                   value="${service.standardRoom}" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="descriptionOtherConvenience" class="cols-sm-2 control-label">Description Other
                        Convenience:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon iconbk"><i class="fa fa-user-plus fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="descriptionOtherConvenience"
                                   id="descriptionOtherConvenience"
                                   value="${service.descriptionOtherConvenience}" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="poolArea" class="cols-sm-2 control-label">Pool Area:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon iconbk"><i class="fa fa-user-plus fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="poolArea" id="poolArea"
                                   value="${service.poolArea}" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="numberOfFloors" class="cols-sm-2 control-label">Number Of Floors:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon iconbk"><i class="fa fa-user-plus fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="numberOfFloors" id="numberOfFloors"
                                   value="${service.numberOfFloors}" required/>
                        </div>
                    </div>
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