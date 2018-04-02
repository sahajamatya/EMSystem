<%-- 
    Document   : header.jsp
    Created on : Mar 22, 2018, 2:50:33 AM
    Author     : dell-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EMSys Control Panel</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        
        <link rel="icon" href="${pageContext.request.contextPath}/static/tools.png" type="image/png" >
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="http://code.jquery.com/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <style>
            .onoffswitch3
            {
                position: relative; width: 200px;
                -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
            }

            .onoffswitch3-checkbox {
                display: none;
            }

            .onoffswitch3-label {
                display: block; overflow: hidden; cursor: pointer;
                border: 0px solid #999999; border-radius: 5px;
            }

            .onoffswitch3-inner {
                display: block; width: 200%; margin-left: -100%;
                -moz-transition: margin 0.3s ease-in 0s; -webkit-transition: margin 0.3s ease-in 0s;
                -o-transition: margin 0.3s ease-in 0s; transition: margin 0.3s ease-in 0s;
            }

            .onoffswitch3-inner > span {
                display: block; float: left; position: relative; width: 50%; height: 30px; padding: 0; line-height: 30px;
                font-size: 14px; color: white; font-family: Microsoft JhengHei UI; font-weight: bold;
                -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;
            }

            .onoffswitch3-inner .onoffswitch3-active {
                padding-left: 10px;
                background-color: #EEEEEE; color: #FFFFFF;
            }

            .onoffswitch3-inner .onoffswitch3-inactive {
                padding-right: 10px;
                background-color: #EEEEEE; color: #FFFFFF;
                text-align: right;
            }

            .onoffswitch3-switch {
                display: block; width: 50%; margin: 0px; text-align: center; 
                border: 0px solid #999999;border-radius: 5px; 
                position: absolute; top: 0; bottom: 0;
            }
            .onoffswitch3-active .onoffswitch3-switch {
                background: #b2c4aa; left: 0;
            }
            .onoffswitch3-inactive .onoffswitch3-switch {
                background: #E1684A; right: 0;
            }
            .onoffswitch3-checkbox:checked + .onoffswitch3-label .onoffswitch3-inner {
                margin-left: 0;
            }
            .onoffswitch4 {
                position: relative; width: 90px;
                -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
            }

            .onoffswitch4-checkbox { 
                display: none;
            }

            .onoffswitch4-label {
                display: block; overflow: hidden; cursor: pointer;
                border: 2px solid #b2c4aa; border-radius: 5px;
            }

            .onoffswitch4-inner {
                display: block; width: 200%; margin-left: -100%;
                -moz-transition: margin 0.3s ease-in 0s; -webkit-transition: margin 0.3s ease-in 0s;
                -o-transition: margin 0.3s ease-in 0s; transition: margin 0.3s ease-in 0s;
            }

            .onoffswitch4-inner:before, .onoffswitch4-inner:after {
                display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 26px;
                font-size: 14px; color: white; font-family: Microsoft JhengHei UI; font-weight: bold;
                -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;
                border: 2px solid transparent;
            }

            .onoffswitch4-inner:before {
                content: "Active";
                padding-left: 10px;
                background-color: white; color: #b2c4aa;
            }

            .onoffswitch4-inner:after {
                content: "Inactive";
                padding-right: 10px;
                background-color: #c4aab2; color: white;
                text-align: right;
            }

            .onoffswitch4-switch {
                display: block; width: 20px; margin: 0px;
                background: #b2c4aa;
                position: absolute; top: 0; bottom: 0; right: 70px;
                -moz-transition: all 0.3s ease-in 0s; -webkit-transition: all 0.3s ease-in 0s;
                -o-transition: all 0.3s ease-in 0s; transition: all 0.3s ease-in 0s; 
            }
            .onoffswitch4-checkbox:checked + .onoffswitch4-label .onoffswitch4-inner {
                margin-left: 0;
            }

            .onoffswitch4-checkbox:checked + .onoffswitch4-label .onoffswitch4-switch {
                right: 0px; 
            }

            .onoffswitch5 {
                position: relative; width: 90px;
                -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
            }

            .onoffswitch5-checkbox {
                display: none;
            }

            .onoffswitch5-label {
                display: block; overflow: hidden; cursor: pointer;
                border: 2px solid #b2c4aa; border-radius: 5px;
            }

            .onoffswitch5-inner {
                display: block; width: 200%; margin-left: -100%;
                -moz-transition: margin 0.3s ease-in 0s; -webkit-transition: margin 0.3s ease-in 0s;
                -o-transition: margin 0.3s ease-in 0s; transition: margin 0.3s ease-in 0s;
            }

            .onoffswitch5-inner:before, .onoffswitch5-inner:after {
                display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 26px;
                font-size: 14px; color: white; font-family: Microsoft JhengHei UI; font-weight: bold;
                -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;
                border: 2px solid transparent;
            }

            .onoffswitch5-inner:before {
                content: "Active";
                padding-left: 10px;
                background-color: white; color: #b2c4aa;
            }

            .onoffswitch5-inner:after {
                content: "Inactive";
                padding-right: 10px;
                background-color: #c4aab2; color: white;
                text-align: right;
            }

            .onoffswitch5-switch {
                display: block; width: 20px; margin: 0px;
                background: #b2c4aa;
                position: absolute; top: 0; bottom: 0; right: 70px;
                -moz-transition: all 0.3s ease-in 0s; -webkit-transition: all 0.3s ease-in 0s;
                -o-transition: all 0.3s ease-in 0s; transition: all 0.3s ease-in 0s; 
            }
            .onoffswitch5-checkbox:checked + .onoffswitch5-label .onoffswitch5-inner {
                margin-left: 0;
            }

            .onoffswitch5-checkbox:checked + .onoffswitch5-label .onoffswitch5-switch {
                right: 0px; 
            }
        </style>
    </head>
    <body>
        <div class="container" style="font-family: Microsoft JhengHei UI"> 