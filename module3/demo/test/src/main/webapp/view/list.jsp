<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/6/2020
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>List Customer</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Roboto', sans-serif;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            min-width: 1000px;
            background: #fff;
            padding: 20px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 10px;
            margin: 0 0 10px;
            min-width: 100%;
        }

        .table-title h2 {
            margin: 8px 0 0;
            font-size: 22px;
        }

        .search-box {
            position: relative;
            display: flex;
        }

        .search-box input#keywordCustomerDisplay {

            border-radius: 20px;
            padding-left: 35px;
            border-color: #ddd;
            box-shadow: none;
        }

        .search-box input {

            border-radius: 20px;
        }

        .search-box input:focus {
            border-color: #3FBAE4;
        }

        .search-box i {
            color: #a0a5b1;
            position: absolute;
            font-size: 19px;
            top: 11px;
            left: 10px;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child {
            width: 130px;
        }

        table.table td a {
            color: #a0a5b1;
            display: inline-block;
            margin: 0 5px;
        }

        table.table td a.view {
            color: #03A9F4;
        }

        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #E34724;
        }

        table.table td i {
            font-size: 19px;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 95%;
            width: 30px;
            height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 30px !important;
            text-align: center;
            padding: 0;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 6px;
            font-size: 95%;
        }

        .message {
            text-align: center;
            color: orangered;
        }

        /*#search {*/
        /*    padding-left: 5px;*/
        /*}*/
    </style>

    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>
<body>
<%--<form>--%>
<h3 class="message">${message}</h3>
<div class="container-fluid">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8">
                        <h1 style="color: red">Customer List</h1>
                        <p>
                            <a href="/customer?actionFurama=showCreateNewCustomer"><h3>Create New Customer</h3></a>
                        </p>
                    </div>
                    <div class="col-sm-4">
                        <div class="search-box">
                            <i class="material-icons">&#xE8B6;</i>
                            <input type="text" name="nameCustomer" class="form-control" id="keywordCustomerDisplay"
                                   placeholder="Search by Name">
                            <input type="button" value="Search" class="btn btn-primary"
                                   onclick="submitFormSearchCustomer()">
                        </div>
                    </div>
                </div>
            </div>
            <table id="tableCustomer" class="table table-striped table-hover table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>BirthDay</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${customerList}" var="customer">
                    <tr>
                        <td>${customer.id}</td>
                        <td>${customer.name}</td>
                        <td>${customer.birthDay}</td>
                        <td>${customer.gender}</td>
                        <td>${customer.email}</td>
                        <td>${customer.address}</td>
                        <td>
                            <a href="/customer?actionFurama=showEditCustomer&id=${customer.id}" class="edit"
                               title="Edit"
                               data-toggle="tooltip"><i
                                    class="material-icons">&#xE254;</i></a>
                                <%-- <a href="/customer?actionFurama=showDeleteCustomer&id=${customer.getId()}" class="delete"--%>
                                <%-- title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>--%>
                            <a data-toggle="modal" data-target="#deleteCustomerModal" href="#"
                               onclick="setCustomerId('${customer.id}')" class="delete" title="Delete"
                               data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <p>
                <a href="/furama">Home</a>
            </p>

            <div id="deleteCustomerModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/customer">
                            <input type="hidden" name="actionFurama" value="deleteCustomer"/>
                            <input type="hidden" name="idCustomer" id="id"/>
                            <div class="modal-header">
                                <h4 class="modal-title">Delete Customer</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="text" id="warning" style="width: 100%" />
                                <%--<p>Are you sure you want to delete this customer ?</p>--%>
                                <p class="text-warning"><small style="color: blue">This action cannot be undone.</small>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-danger" value="Delete">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--</form>--%>
<form method="post" action="/customer" id="formSearchCustomer">
    <input type="hidden" name="actionFurama" value="searchCustomer">
    <input type="hidden" name="nameCustomer" id="keywordCustomerHidden"/>
    <input hidden type="submit" value="Search"/>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>

<script>
    function setCustomerId(id) {
        document.getElementById("id").value = id;
        document.getElementById("warning").value = "Are you sure you want to delete Customer have id is " + id + " ?";
    }

    function submitFormSearchCustomer() {
        let keywordHidden = document.getElementById("keywordCustomerHidden");
        let keywordDisplay = document.getElementById("keywordCustomerDisplay");
        keywordHidden.value = keywordDisplay.value;
        document.getElementById("formSearchCustomer").submit();
    }

    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

</body>
</html>