<%@ page language="java" import="java.util.*, task.model.Doctor" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Best Doctors in Visakhapatnam</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>

        
        
        body {
            background-color: #f0f0f0; 
        }
        .page-header {
            background-color: #007BFF;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container-custom {
            margin-top: 20px;
        }

      
        .doctor-card {
            border-radius: 10px;
            margin: 10px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            overflow: hidden;
            background-color: #f8f9fa; 
        }

        .doctor-card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

     
        .btn-view {
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-view:hover {
            background-color: #0056b3;
        }

 
        .card-row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .card-column {
            flex: 0 0 calc(33.3333% - 20px); 
        }
    </style>
</head>
<body>
    <div class="page-header">
        <h1>Best Doctors in Visakhapatnam</h1>
    </div>

    <div class="container container-custom">
        <div class="form-group">
            <label for="designationSelect">Search Doctors:</label>
            <select class="form-control" id="designationSelect">
                <option value="">All</option>
                <option value="Neurologist">Neurologist</option>
                <option value="Cardiologist">Cardiologist</option>
                <option value="Orthopedic Surgeon">Orthopedic Surgeon</option>
                <option value="Dermatic Surgeon">Dermatic Surgeon</option>
                <option value="Opthalmogist">Opthalmogist</option>
            
            </select>
        </div>

        <div class="card-row" id="cardContainer">
          <%
    ArrayList<Doctor> doclist = (ArrayList<Doctor>) request.getAttribute("doctors");
    if (doclist != null) {
        for (Doctor d : doclist) {
            String img = d.getPhoto();
            System.out.println(img);
            String name = d.getFullname();
            String qual = d.getQualification();
            int exp = d.getExperience();
            String desp = d.getDesignation();
        %>
        <div class="col-md-4 card-column doctor-card">
            <img src="<%= img %>" class="card-img-top" alt="<%= name %>'s Photo">
            <div class="card-body">
                <h5 class="card-title"><%= name %></h5>
                <p class="card-text"><%= desp %></p>
                <a href="doc?img=<%= java.net.URLEncoder.encode(img, "UTF-8") %>&name=<%= name %>&qual=<%= qual %>&exp=<%= exp %>&desg=<%= desp %>" class="btn btn-view">View Doctor</a>
            </div>
        </div>
<%
    }
}
%>
        </div>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
    var $designationSelect = $('#designationSelect');
    var $doctorCards = $('.doctor-card');

    $designationSelect.on('change', filterCards);

    function filterCards() {
        var selectedDesignation = $designationSelect.val().toLowerCase();

        
        $doctorCards.show();

        if (selectedDesignation !== "") {
            $doctorCards.each(function(index) {
                var cardDesignation = $(this).find('.card-text').text().toLowerCase();
                if (cardDesignation !== selectedDesignation) {
                    $(this).hide(); 
                }
            });
        }
        
       
        var $cardContainer = $('#cardContainer');
        var $cardColumns = $cardContainer.find('.card-column');
        $cardContainer.html($cardColumns); 
    }

    filterCards();
});
</script>



</body>
</html>