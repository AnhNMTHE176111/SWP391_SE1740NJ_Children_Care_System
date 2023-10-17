<%-- 
    Document   : reservationInformation
    Created on : Oct 17, 2023, 10:42:35 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
            integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link href="css/reservation.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container-fluid">
            <div class="col-md-12">
                <div class="row">
                    <h2>Your Reservation Id:</h2>
                </div>
            </div>
            <form>
                <div class="col-md-12 reservation-info">
                    <div class="row">
                        <div class="col-md-3 reservation-info-content">
                            <label>Full Name</label>
                            <input type="text" />
                        </div>
                        <div class="col-md-3 reservation-info-content">
                            <label>Gender</label>
                            <input type="text" />
                        </div>
                        <div class="col-md-3 reservation-info-content">
                            <label>Telephone Number</label>
                            <input type="text" />
                        </div>
                        <div class="col-md-3 reservation-info-content">
                            <label>Email Address</label>
                            <input type="text" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 reservation-info-content">
                            <label>Reservation Date</label>
                            <input type="text" />
                        </div>
                        <div class="col-md-3 reservation-info-content">
                            <label>Time To Check Up</label>
                            <input type="text" />
                        </div>
                        <div class="col-md-3 reservation-info-content">
                            <label>Doctor Name</label>
                            <input type="text" />
                        </div>
                        <div class="col-md-3 reservation-info-content">
                            <label>Status</label>
                            <input type="text" />
                        </div>
                    </div>
                    <div class="row reservation-button">
                        <button class="bg-success btn-3" type="submit">
                            Update The Reservation
                        </button>
                        <button class="bg-danger btn-3" type="submit">
                            Cancel The Reservation
                        </button>
                    </div>
                </div>
            </form>
            <div class="col-md-12 list-services">
                <form class="reserved-services">
                    <div class="reserved-services-details">
                        <h2>X-ray service</h2>
                        <div>
                            <p>
                                Chụp X-ray cho cơ xương khớp
                            </p>
                        </div>
                    </div>
                    <div class="reserved-services-details">
                        <h4>Doctor</h4>
                        <p>Doctor Name</p>
                    </div>
                    <div class="reserved-services-details">
                        <h4>Price</h4>
                        <p>30,000VND</p>
                    </div>
                    <div class="reserved-services-details">
                        <button type="submit" class="btn-reserve">Re-reserve</button>
                        <button type="submit" class="btn-feedback">Feedback</button>
                    </div>
                </form>
            </div>
            <div class="col-md-12 list-services">
                <form class="reserved-services">
                    <div class="reserved-services-details">
                        <h2>Dịch vụ x-ray</h2>
                        <div>
                            <p>
                                Chụp X-ray cho cơ xương khớp
                            </p>
                        </div>
                    </div>
                    <div class="reserved-services-details">
                        <h4>Doctor</h4>
                        <p>Doctor Name</p>
                    </div>
                    <div class="reserved-services-details">
                        <h4>Price</h4>
                        <p>30,000VND</p>
                    </div>
                    <div class="reserved-services-details">
                        <button type="submit" class="btn-reserve">Re-reserve</button>
                        <button type="submit" class="btn-feedback">Feedback</button>
                    </div>
                </form>
            </div>
            <div class="paging col-md-12">
                <a href="#"><button class="btn-1">1</button></a>
                <a href="#"><button class="btn-1">1</button></a>
                <a href="#">3</a>
            </div>
            <div class="row">
                <div class="col-md-2"><h2>Post</h2></div>
                <div class="post-search col-md-10">
                    <input class="post-search-input" type="text" placeholder="Search" />
                    <button class="btn btn-search" type="submit">
                        <i class="fa-solid fa-magnifying-glass"> </i>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="card">
                        <img
                            src="https://images.unsplash.com/photo-1514477917009-389c76a86b68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1067&q=80"
                            class="card-img-top"
                            alt="..."
                            />
                        <div class="card-body">
                            <h5 class="card-title">Product Name</h5>
                            <label style="float: left"><i class="fa-solid fa-eye"></i></label>
                            Viewer: 1234 <label style="float: right">Rating:<i></i></label
                            ><br />
                            <p>
                                Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,
                                consectetur, adipisci velit...
                            </p>
                            <a href="#">Read More <i class="fa-solid fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="card">
                        <img
                            src="https://images.unsplash.com/photo-1514477917009-389c76a86b68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1067&q=80"
                            class="card-img-top"
                            alt="..."
                            />
                        <div class="card-body">
                            <h5 class="card-title">Product Name</h5>
                            <label style="float: left"><i class="fa-solid fa-eye"></i></label>
                            Viewer: 1234 <label style="float: right">Rating:<i></i></label
                            ><br />
                            <p>
                                Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,
                                consectetur, adipisci velit...
                            </p>
                            <a href="#">Read More <i class="fa-solid fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="card">
                        <img
                            src="https://images.unsplash.com/photo-1514477917009-389c76a86b68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1067&q=80"
                            class="card-img-top"
                            alt="..."
                            />
                        <div class="card-body">
                            <h5 class="card-title">Product Name</h5>
                            <label style="float: left"><i class="fa-solid fa-eye"></i></label>
                            Viewer: 1234 <label style="float: right">Rating:<i></i></label
                            ><br />
                            <p>
                                Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,
                                consectetur, adipisci velit...
                            </p>
                            <a href="#">Read More <i class="fa-solid fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script
        src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"
    ></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"
    ></script>
</html>
