<%-- 
    Document   : home.jsp
    Created on : Sep 17, 2023, 9:54:48 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet"/>
    </head>
    
    <body>
        <!-- Navbar Start -->
    <div class="container-fluid position-relative shadow">
        <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0 px-lg-5">
            <a href="" class="navbar-brand font-weight-bold text-secondary" style="font-size: 50px;">
<!--                <i class="flaticon-043-teddy-bear"></i>-->
                <span class="text-primary">ChildCare</span>       
            </a>
<!--            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>-->
            
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav font-weight-bold mx-auto py-0">
                    <a href="index.html" class="nav-item nav-link active">Home</a>
                    <a href="about.html" class="nav-item nav-link">Blogs</a>
                    <a href="class.html" class="nav-item nav-link">Services</a>
                    <a href="team.html" class="nav-item nav-link">Doctors</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Specialist</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="blog.html" class="dropdown-item">Blog Grid</a>
                                <a href="single.html" class="dropdown-item">Blog Detail</a>
                            </div>
                        </div>
                    <a href="contact.html" class="nav-item nav-link">Booking</a>
                </div>
                <a href="login.jsp" class="btn btn-primary px-20">Login</a>
                <a href="" class="btn btn-primary px-20">Signup</a>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Header Start -->
    <div class="container-fluid bg-primary px-0 px-md-5 mb-5">
        <div class="row align-items-center px-3">
            <div class="col-lg-6 text-center text-lg-left">
                <h4 class="text-white mb-4 mt-5 mt-lg-0">Children's health care center</h4>
                <h2 class="display-3 font-weight-bold text-white">Dedication to children's health care</h2>
                <p class="text-white mb-4">Support and advice on health, emotions, and life – designed for kids and approved by doctors.</p>
                <a href="" class="btn btn-secondary mt-1 py-3 px-5">Learn More</a>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <img class="img-fluid mt-5" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBIVFRgSFRISGBUaFRgSGBIYERIYGBgRGBgZGRgYGhgcIS4lHB4rHxgYJjgmKy8xNTU1GiQ7QDszPy40NTEBDAwMEA8QHhISGjQlJSs0MTQxNDQ0NDQ0NDQ0NDE0NDQ0NDQ0NDE0NDQ0NDQ0MTQ0NDQxNDQ0MTE0NDQ0NDQ0NP/AABEIALcBEwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAACAQMEBQYABwj/xABAEAACAQIEBAMGAwUGBgMAAAABAgADEQQSITEFQVFhBnGBEyIykaGxB0LBI1Ji0fAUcoKSsuEkc4OiwvEVM0P/xAAZAQEAAwEBAAAAAAAAAAAAAAAAAQIEAwX/xAAjEQEBAAICAgICAwEAAAAAAAAAAQIRAyESMQRBMnETIlGR/9oADAMBAAIRAxEAPwD1iqI5Q2iVIWH2kh0RTOiyA0Z0UidaAghrAMUGA6IsAGFeAs6dEMBG2kdpJMjvJgYeNNHakYVtbSYgKGR61L3w0kOLaxVIMkTMKdbSXIGHazfST5WpLOnTpA6JFiGAhgkSt4rxzD4cXqVFXzP2Ezy/iNgS2X2lvNWA+ok6GwYTC+KWyJUqBAzIrVMhuASgLDbbaX3DvE2HrmyVFbyMc4lwunVublSRY2sQQdDpK5Y26Wxy1t5l4P449ZGLgDK5Atf4CAQD87ek061gZjPAfBajU66o9MVKWIakysrDMAoAOYXtqrcjLXgHE3xGIqUFQMlNsntlYlWe9iFBG2jG/QA8xKZcV306Y5zXbS4egXNh6noJc4bCqg0HrzjuDwoQZR5k9TJDiXwwmP7c8svL9IrgDUyK1zrsJLKk6n0HSNVBOiiD7MdJ0lZYkkaEiLQhOIlESiT0WIIsgNmJeK0EwAdrQVqiN4k6SAjm8mRC7pm8ckbCtpJMhLoLSv4jxnDUP/tqop2C3uxPQAazKcc/EGigtRDM4BJBWwB6Ek6dz6dZOhuwYzU3nluK/FlgoyYdLk7lywtzKroW1B1NhIy/ijVZmOWmoA0VlB1vp7wbpfyt30mY1D1RxIlvema4N+IODre67qj3y5feKnuGtt52mkFVHGdGVlPMG4iB9hcRnLYxxW0gmSHKbayzBlSksKL6SKQ/OgZoheVScmX8aeJFwlK41drhR36+Us+K8Zp0ELvfTteeJeP+PnFOGUEKosAe/OTIKDjHGatd2d3JJ6mVC5t48lFz+U/KabhfClKXYamUyzmMXxwuSq8O8WahWR8xC5hfynvPDeKpVQFWB06z5941hPZtptLPwx4mqYdgupQkC38pfHKZTauWOrpf4tcZRxHEMLh6bZ8TXXI4NsiNnd2B5XFQC/KxPKb7wZ4cTB4dUFi+pZ7fE5tnby0AHZRM34Yc4jimJqkn3UWgmugUaObeSX/6neelKtyFA02A7CXUo6dOy+esBxJZWR3ErtKK4kdkkpxGiIEfJFhTo2L5oNPeGYCbyqT0WJFgNPBhtAgRsTtK0byzxI0lY28tELbBGUXiTxTSpLUp02DVgpsAT7raAajuR/QjPFONLTHs1PvsDry05X8yPrPDMdxBmrM2YnVhe/Ll9vUxILnj/FGqOtS5BVAGqatkuScqX/MTfXpblM5UxZa41Cck1OYjmx566yVjGzomwUXO/wATWtfryt5ACVhBO30iJNu5vvr/AF8oGUyxwvDKrkBKbMTsAp+d+k0vA/Bbu2auCqD8nNj36CRlnjj7q2OGVYtHI2m68MeNK1JlNU5kvZrjU09LkH8xXfr9pfv4Zw4FlpqAdyBqe1zIfFOCU3pGmqhbC6G3wvy9Os5/zT/HT+G/69PoVgyhgbgi4PUHaEzTHfh3xBnw3snuHouaLKdwBqn009JriZ2cEimdJMw+0g0pMwx0kB4wTCYwCYEPinD1qIQReYHiPhymgYlQd7aT0uobraZ3ieHtc30lcvS2N7eeYDCgkhqYAG2kerUHDAIvuyzxLqpj2GqKRMdvbXMWW8Q8OUpdhrMfgaQ/tCWFxTvVI/5YLgerKo9ZtfFnEVpjrMVhHOSrWAsXZKKm/U+0Y+hSmP8AHO/DK5c1jbfhfxKmmKem5F6qZUcndkIsL9WRR/lnsmGXUntPmPB1CrBlJUghlI0IIPukeVhPovwzWqPhqNSq13emKjWXL8Wo08rTTl6Z1s7SO0eaNGUDRWNssfaMtJDWSdHJ0kWxgLvHDGxvKJOiLEiwAaNmONGzAZrjSVOJbKCegJlxVGkzfHMQqI4bb2bsxteyhSdueokxDyzj3H6je7c3IZtOWcnKPQa+vaZKlTF8z7fug6nzPIfWX3iKsmchewJ8vdsPl9ZQO5J7DYecmJFjMVe2g6BQNAByl34YwCVDdtzt2mfy3PlL7wviMtVV5MwXyuQAfmbespyb8el+PXl29NwOEVFGVQNAL25CQMbxnK3s6dN6jXsctrDzMuqtC4y3IB3sbaTP8Wr1U/ZYWhmbnUOVUU+Z3PleZJJtp2k4fE1G+NVXsDfSBj1YD3TrylXwn+1q/wC3KtzuCND00FrS54lhHqUyEbK9vda2xj1dJ+tofhhK9PEsz5CtRMhKgj3kuULDyLi/l0m9p6zyrg3CcVQrpUfEHR7spDEOl9edrz1CnewIOm/pNfHdzW2Xkx1d6TVkqlISNJlBtJdzOMYBMNhAIgHykPGYUOLGOV8QEGsqF4iWc9I0M7xrBKhudRKSpjANEBM2nEaauNZTjAqvwqJyy4d3p2x5rJqsvW8PVMSQXNh0kT/4em+LTBIPcpI1Sobb1GCk6+RpD/CZs61T2aPUc2RFLt3Ci9h3O3rKbwNhGZKmMf469Rmv/AGJ+RYt6ATthjMY5ZZXK7dR8DJUcKvurcZmHJedu89Vw6BQFAsAoUDoALAfKU3BaRzN+7YE+d9P1l1SOsWoE5gGG0CQEIjLR5o0YA2nQp0C0gc4cEyqRxYkWALRuONGzAbqbTEeM6jIjsBoUOvYAkj6Cbh9plfFmE9pQdQLmxI/ykfrF9E9vCcfUDEsDvqexvf9ZFRtSOstOKYEUrqB71wVbXVLa/X7yuVecuBI/wB5deFaRfEU0H76sT0VTmP+n6ylJubD+jLzwtWZMSjAXtpl6gmxIlOT8ath+UexZb6RHwgPKdh2vJoOkxybavSjxOGVBmEYbEutiAu/vFidv4VHPzj/ABjEopAZgq/ESe3KVL4tHsVdVQgMGsWJBbLsux52PKJi6RIbHBnAOWwH/cf0mg4dV/JfS1x27TCY2qyFSgLjMQ4yMpAubEX3vp85rOAuWyE9/lYy+P8AXKOfJjLjWikzBtIUJKmUgzWxLYiAROp1AReBVqBRqYFVxmqtrc5R0L3jvE8Yhc+8PnGBWFtJMExjGXgpVhO4kjI+OsUzLTwafHWdb/3FYWv2zWP/AE5rMBh0polNRZUVUUfwqLCYTDVP7RxCtX3SiPZp5i6aevtG/wAU3XDXLgddoo0fC0shP7zfQf0ZLonQ+c5ECqFHIWgUNj5mR9B47QIbbQZAFoENoEBJ0SdAtILQrRDKpEIsQRYCGNGOmMsYAvKrGAX12loxlXj0zXFrgggjsZI8U8clf7RkB0BYb3sb/wBfSZltWCjmbes1njfh/wDxLoylWJBR9bOLWHk2g9ZkMTh3RsrXvvfzk7F1ifD1UBalNGZSBmABJV+YNvneaLw3wGpTrrVq08ihLi5HxNYC4G0p+CeMq9AZHQVVGmbNlcAci1jm9de80lPxOMSppCnkzDU58xy8wNBM3Jc5NVpwmFvTW4aqLywD6TLYR3Xc3HWWaYywmbHLTtcT2PoBiDYGx6cjGhhUtpTX5CccXFGOtuvylvI7RnoqNkAPkJY8Bo69lB+Z2+l5Go4j2j5UU35m2gHUzQYWiqLlHmT1PWduKeV24cuWpo6VjFUyVGMRSupE1RmDh8cqm15G4y+fQNp2lDjVdCdSR1kDGcY9ml2NzyE6ZSSbRjbbpE4tw+pe6sQOZkjDV8ihSSZVVOO1CLupC7+klcI4xhn0uL95THKX0tcbPa5o4gHnGOM4/wBlRqVdLohZdd3OiD1YqPWE9FTqjD0MzfjUuVoYRT79eqL9kUgC/mzA/wCAyUF8JYXJhgxvmqMah65dl+gv6z0DwxQu1+SjN68v67Ssp8MVVRF2UBR5AWE1vCsOEpjTVtT5cpFomttApjfzhVDAQyPoPNAhNBgI0GE0EwBnTp0CzE4zpxlUlEWIIsBIJQQ50Bv2QgmgI9OgYr8QPDxrUPa00L1KZzZBuyc8v8Q0I8p47iaFRytJqbjEFgqU2Qh3zbXU78tfO8+lpUcRZWOirmFxmsMwU7gHcX5znyZzDHdWxlt08GfwTjx/+dMdf2qn7Xh4LgeJoVVZ1sgGri5Hk37vrPYqlIdJFq4cEa+8OhGtu3WYc/lZXrpow48ZdqDC1RYCSGW+0ZxPDnpnNTGZNynMD+Dr/d+XSFSrKe3nKY5zJ3N1CRKviHECiM2psCbdZc17W5TOcb+B/wC4R62l57L6NYBqzXqPUcMdQEd1Cjlax+s3fBMbUFFC7Fzl3O5F9Dfra0x/B8M1Uqo2sCx6L/MzZ5AAFG21u0ry8txs8eqpcZZqrjD4lX2OvQwcVW5CVyC2sDEYpUBZ2AG9zN3xOf8Al6y9xk5sPHuExYGU3mL4hws1GzBtAdBLjFcap1brTYHrYwadp05+S78Ytw8c1uqHE4ZguUrcbaCF4J8MoHq4qot8hCU0YaBzqzsp3IGW3cnoJreGotyxGoFh2vuf66yYlMAWubXJv3M4Y24uuWMvTP8AGMSUsFDEkHRQdPlMt4cV8Ri3xdR3tSJpU1bcEBhY32AzMbdW7TdcTwRdSFdkf8tRQCVPI2OhHaZrw7w6rh19lV1bMzZxqrhmJvfmdeestMtS2IslsljcULNax3mmUbDoAJisBiCtejSysVdyMwFwpVS9j0uFM2wM0Y3cjPlNUNSMobNHjGHllUlok4zpAQwWhQWgBOnToFpFiCdKpKIsQRYDTUzyYiNMlQbMp8xJU6BCNWsN0U+RgHHkfFTceQvLCBUYAXMbEOrirrcAi/UWNpWO0mYl/nvILTzvkZbyaOOagSZHqrbyO3Yx9o0wuLeo85jydojqAfv5HY/WRquBpve/uvzK2+dtjJK/W9j8v9p1RPzcx9pSWzuLqitwar+R0Ydwyn6XlTjvDmJe4/Z2P8Z2+U16OesNzpOmPJkWqbgnDfYJkJBcnMxF7dgL8gJZWic4srld1WV2bSYv8R3IwuYMQc6LodwwN/0mvvMP+I9T/hQOtVPs06/FtnNNKcs/qwXBOKtQe9/dO89HwHEkqKGUzyQCbvwpwuoqe0JNjynscmG5uM3Hnq6re8Le5byFvnLW0y/hrFEvVQkZlZbDmUIOvzBmnVtJlabSOkiVkk1jACMxsBc9AIQXgCXrA9FY/p+s1Mz/AAvDOlXMykKUK3uNDcH9JfXmnjmsWbku6RjGmMdMBhOqh6IZwM4yAkFoUBoATp06SLYTogiyiSiLBEKB06dOgJIuJqC4HrJRlNXc3N95w5s/HFfCbpqs9zGWhGA083O7u2mTQCY2+hhnpGn6TnUwF7knkQp9dY4si0X9516EHyuP53kgGUnpa+zext8vKEz6XiYkbN0+0aZtLdxE6qb6cDz9Y3WcAQnBI0NuZ0vpM14h4q9IhlIsu+lybWJA6bj/ADdpbHG5XUR1Fy+KUKTcaXJNxoJkuNUFxlNaRZkUMHzWF2AFtAZIr4ov8ZNiM+Tm1+Z7SGKGJqOCiZFAILOCBY9Budv95p4OO4Xyt7TljjZ2g4TwdhQwJqV2sdroPrlmyXhwRMtHcDRWJIPmeUDA8KVACSSRzJ69hJmJxFOkjVHYKii5Pbp3Owt3m3Hky+64ZYY/TL0McMPiQ1ZSgqL7N77Kb3Vr7Fb3Fx1vym3pG439e088wtGpxOv7VwVwtMkKhPxm/wAPcnQsfJR1novDuHKtOyLbKfgF7ZTroDtz0k5Y/wDVZl9/R1KZYhRudJe4fDqigD1PUyFwtLsW6D7/APqWk6ceGu3PPK3o0yA7xskpvqvXp5yRBYzq5m0qA7GIxgNSXcC3lpI9V2HMGTBYXnXjVJswB7R0yB0BoV42xgDedAvFki4EWCDFvKJKDCjamOQFnRIsBJV45LN2Ov8AOWkjY2ldb8x9px5sfLFbG6qnaNmOOI0xnl5+2qGmOsbq9Y5UOsZZpSpR0YZ2tvYA/Uj7mSFkOiPffrdfllFpKVpTax1hcEdrSAjaWO4Nj6SapkPEDK9+Tf6hFS5zKagULOtV1CszMq5RfRiCSfQD0EtKz6EzG4+pSNZ0avlqFQtOnY/A73fW1r6NudgJq+J+V/Tnl9LnGVcOgv7RAt9LkDTpI78YFrIlx+8TlFvlKc4HX3FzkWuxOg0/rYcoQwdS5LPbT4VHLzM16n0vr/VrQ4sb2I76G8zXE8e+PrCijEUEOZnHPv5nUL6mR+K1ffGHw4LVHGRyCdjupPTmTy26zQcJ4SlFMlib2ZmKn3n5ntsLTpjLjNuOWsstRoOF1ERFpooCqMoUbATScEq3zj+6f9UyOEqqhsCLfUTQcAxSl2AOuUH62/WTx3eSOSSY9NNRpgXIFid+8O8BDpFDTQzCMBh1jgMZxBsIgZrOQNN+XlItHCsTdmJ6L/OTmSOILCTtGiU0CiwnM8UxtoSK8FzALRC0BLzoF50C6EICADONQDnKpOiFIxxEH25kCQ7gbxVcHmJAxz3Eq2qEbE/OToaWcRM6mPqD80fTi7DcAxo2XGJlJ+khGWeKIYX7XHkdf1lUTPI+Rj45NWF3A1RpI7mSW2kVpnXRc3vnyH3MfQyCG/aMP4R+slreUvtc+DGcWmZSOe484d4hMCrdsy/cd5iMJSzcTrltcie6O+VF/wDJvnN1iqeU5hsd/OZDjPC66VzjMPlJdcj02O+wuNRe4VeYIK87zT8eyeU3rccs5bpeYempAuPqR9plvEfFFd1w+GLM9/eZGNr/ALoa+oHM7Dz258HxLEn2bslBDqyjUlT2UkkdiwE1XCeAUcPTyot2NsztYu1up5DsNJp+LjMctXLd/wAnqOfLlbOld4c4CtBcze9VYe8/Qfur2+/ytflLA+UVyEQsdhrMN4g8ZAg06W+156jOzPiVyMS5ViO4JH2lr+HuIrU8SXQZgUKOCx1BIYG/UFR9Zl6jliWY3J1Jnon4ccO9xqhG5+kaHsOGqBgD1APzhuJXYR7IO2nykynXB3lbA6rwK50nN1E69xIgMQGqAWvzNvWIp0+kaxK3XyIMaEhoDGCj3E5zJDbGCHnOYyzSQeaLGM86BZGsTzih506VC54LPFnQArtpIDmdOiBljAvOnSRbI16an+H7HL/KQa3WdOnlfL/Jo4vQM2kjVmnTpid1bSP7Rz2UfSTFaLOlL7X+hZ4DNFnSUGnsRYyqxalRble48p06TPSt9hY6o3pLdV0HlOnTd8D87+nHm9FrYcOpU7EWnlnijws9Jy6WKk3tcC06dPXjMHwz4TauwZ7BOlxc/Ket8N4alFBTQAAC0WdFE1Vj1OdOlKHTXsQPKHnnTpNB5oBadOgNXtCFS4izpIYqNI7vOnSYqbzzp06Fn//Z" style="width: 150%" alt="">
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- Registration Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-7 mb-5 mb-lg-0">
                    <p class="section-title pr-5"><span class="pr-2">Book A Seat</span></p>
                    <h1 class="mb-4">Book A Seat For Your Kid</h1>
                    <p>Invidunt lorem justo sanctus clita. Erat lorem labore ea, justo dolor lorem ipsum ut sed eos,
                        ipsum et dolor kasd sit ea justo. Erat justo sed sed diam. Ea et erat ut sed diam sea ipsum est
                        dolor</p>
                    <ul class="list-inline m-0">
                        <li class="py-2"><i class="fa fa-check text-success mr-3"></i>Labore eos amet dolor amet diam</li>
                        <li class="py-2"><i class="fa fa-check text-success mr-3"></i>Etsea et sit dolor amet ipsum</li>
                        <li class="py-2"><i class="fa fa-check text-success mr-3"></i>Diam dolor diam elitripsum vero.</li>
                    </ul>
                    <a href="" class="btn btn-primary mt-4 py-2 px-4">Book Now</a>
                </div>
                <div class="col-lg-5">
                    <div class="card border-0">
                        <div class="card-header bg-secondary text-center p-4">
                            <h1 class="text-white m-0">Book A Seat</h1>
                        </div>
                        <div class="card-body rounded-bottom bg-primary p-5">
                            <form>
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 p-4" placeholder="Your Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control border-0 p-4" placeholder="Your Email" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 p-4" placeholder="Your Phone Number" required="required" />
                                </div>
                                <div>
                                    <button class="btn btn-secondary btn-block border-0 py-3" type="submit">Book Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Registration End -->
    
    
    
    <!-- Team Start -->
    <div class="container-fluid pt-5">
        <div class="container">
            <div class="text-center pb-2">
                <p class="section-title px-5"><span class="px-2">Our Doctor</span></p>
                <h1 class="mb-4">Meet Our Doctor</h1>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-3 text-center team mb-5">
                    <div class="position-relative overflow-hidden mb-4" style="border-radius: 80%;">
                        <img class="img-fluid w-100" src="data:image/jpeg;base64,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" alt="" >
                    </div>
                    <h4>Ngo Minh Tuan Anh</h4>
                    <i>Professor</i>
                </div>
                <div class="col-md-6 col-lg-3 text-center team mb-5">
                    <div class="position-relative overflow-hidden mb-4" style="border-radius: 100%;">
                        <img class="img-fluid w-100" src="image/profile_user/default.jpg" alt="" >
                        <div
                            class="team-social d-flex align-items-center justify-content-center w-100 h-100 position-absolute">
                            <a class="btn btn-outline-light text-center mr-2 px-0" style="width: 38px; height: 38px;"
                                href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light text-center mr-2 px-0" style="width: 38px; height: 38px;"
                                href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light text-center px-0" style="width: 38px; height: 38px;"
                                href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <h4>Jhon Doe</h4>
                    <i>Professor</i>
                </div>
                <div class="col-md-6 col-lg-3 text-center team mb-5">
                    <div class="position-relative overflow-hidden mb-4" style="border-radius: 100%;">
                        <img class="img-fluid w-100" src="img/team-3.jpg" alt="" >
                        <div
                            class="team-social d-flex align-items-center justify-content-center w-100 h-100 position-absolute">
                            <a class="btn btn-outline-light text-center mr-2 px-0" style="width: 38px; height: 38px;"
                                href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light text-center mr-2 px-0" style="width: 38px; height: 38px;"
                                href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light text-center px-0" style="width: 38px; height: 38px;"
                                href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <h4>Mollie Ross</h4>
                    <i>Dance Teacher</i>
                </div>
                <div class="col-md-6 col-lg-3 text-center team mb-5">
                    <div class="position-relative overflow-hidden mb-4" style="border-radius: 100%;">
                        <img class="img-fluid w-100" src="img/team-4.jpg" alt="" >
                        <div
                            class="team-social d-flex align-items-center justify-content-center w-100 h-100 position-absolute">
                            <a class="btn btn-outline-light text-center mr-2 px-0" style="width: 38px; height: 38px;"
                                href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light text-center mr-2 px-0" style="width: 38px; height: 38px;"
                                href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light text-center px-0" style="width: 38px; height: 38px;"
                                href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <h4>Donald John</h4>
                    <i>Art Teacher</i>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->
    
      <!-- Blog Start -->
    <div class="container-fluid pt-5">
        <div class="container">
            <div class="text-center pb-2">
                <p class="section-title px-5"><span class="px-2">Our Blog</span></p>
                <h1 class="mb-4">Typical Blog</h1>
            </div>
            <div class="row pb-3">
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 shadow-sm mb-2">
                        <img class="card-img-top mb-2" src="img/blog-1.jpg" alt="">
                        <div class="card-body bg-light text-center p-4">
                            <h4 class="">Diam amet eos at no eos</h4>
<!--                            <div class="d-flex justify-content-center mb-3">
                                <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>
                            </div>-->
                            <p>Sed kasd sea sed at elitr sed ipsum justo, sit nonumy diam eirmod, duo et sed sit eirmod kasd clita tempor dolor stet lorem. Tempor ipsum justo amet stet...</p>
                            <a href="" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 shadow-sm mb-2">
                        <img class="card-img-top mb-2" src="img/blog-2.jpg" alt="">
                        <div class="card-body bg-light text-center p-4">
                            <h4 class="">Diam amet eos at no eos</h4>
<!--                            <div class="d-flex justify-content-center mb-3">
                                <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>
                            </div>-->
                            <p>Sed kasd sea sed at elitr sed ipsum justo, sit nonumy diam eirmod, duo et sed sit eirmod kasd clita tempor dolor stet lorem. Tempor ipsum justo amet stet...</p>
                            <a href="" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 shadow-sm mb-2">
                        <img class="card-img-top mb-2" src="img/blog-3.jpg" alt="">
                        <div class="card-body bg-light text-center p-4">
                            <h4 class="">Diam amet eos at no eos</h4>
<!--                            <div class="d-flex justify-content-center mb-3">
                                <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>
                            </div>-->
                            <p>Sed kasd sea sed at elitr sed ipsum justo, sit nonumy diam eirmod, duo et sed sit eirmod kasd clita tempor dolor stet lorem. Tempor ipsum justo amet stet...</p>
                            <a href="" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Blog End -->
    
     <!-- Footer Start -->
    <div class="container-fluid bg-secondary text-white mt-5 py-5 px-sm-3 px-md-5">
        <div class="row pt-5">
            <div class="col-lg-3 col-md-6 mb-5">
                <a href="" class="navbar-brand font-weight-bold text-primary m-0 mb-4 p-0" style="font-size: 40px; line-height: 40px;">
                    <i class="flaticon-043-teddy-bear"></i>
                    <span class="text-white">CaChep</span>
                </a>
                <p>Labore dolor amet ipsum ea, erat sit ipsum duo eos. Volup amet ea dolor et magna dolor, elitr rebum duo est sed diam elitr. Stet elitr stet diam duo eos rebum ipsum diam ipsum elitr.</p>
<!--                <div class="d-flex justify-content-start mt-4">
                    <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
                        style="width: 38px; height: 38px;" href="#"><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
                        style="width: 38px; height: 38px;" href="#"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
                        style="width: 38px; height: 38px;" href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
                        style="width: 38px; height: 38px;" href="#"><i class="fab fa-instagram"></i></a>
                </div>-->
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h3 class="text-primary mb-4">Get In Touch</h3>
                <div class="d-flex">
                    <h4 class="fa fa-map-marker-alt text-primary"></h4>
                    <div class="pl-3">
                        <h5 class="text-white">Address</h5>
                        <p>123 Street, New York, USA</p>
                    </div>
                </div>
                <div class="d-flex">
                    <h4 class="fa fa-envelope text-primary"></h4>
                    <div class="pl-3">
                        <h5 class="text-white">Email</h5>
                        <p>info@example.com</p>
                    </div>
                </div>
                <div class="d-flex">
                    <h4 class="fa fa-phone-alt text-primary"></h4>
                    <div class="pl-3">
                        <h5 class="text-white">Phone</h5>
                        <p>+012 345 67890</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h3 class="text-primary mb-4">Quick Links</h3>
                <div class="d-flex flex-column justify-content-start">
                    <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                    <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>About Us</a>
                    <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Classes</a>
                    <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Teachers</a>
                    <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Blog</a>
                    <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h3 class="text-primary mb-4">Newsletter</h3>
                <form action="">
                    <div class="form-group">
                        <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                            required="required" />
                    </div>
                    <div>
                        <button class="btn btn-primary btn-block border-0 py-3" type="submit">Submit Now</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="container-fluid pt-5" style="border-top: 1px solid rgba(23, 162, 184, .2);;">
            <p class="m-0 text-center text-white">
                &copy; <a class="text-primary font-weight-bold" href="#">Your Site Name</a>. All Rights Reserved. 
				
				<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
				Designed by <a class="text-primary font-weight-bold" href="https://htmlcodex.com">HTML Codex</a>
            </p>
        </div>
    </div>
    <!-- Footer End -->
    
        <script src="home.js"></script>
        
    </body>
    

</html>
