<!doctype html>
<html lang="ar">

<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>missaINGN</title>
    <!-- icon -->
    <link rel="icon" href="{{asset('upload').'/'.$settings['logo']}}" type="image/x-icon">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="{{url('/')}}/site/css/bootstrap-rtl.css">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="{{url('/')}}/site/css/mdb.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{url('/')}}/site/css/all.css">
    <!-- owl slider -->
    <link rel="stylesheet" href="{{url('/')}}/site/css/owl.carousel.min.css">
    <link rel="stylesheet" href="{{url('/')}}/site/css/owl.theme.default.min.css">
    <!-- More -->
    <link rel="stylesheet" href="{{url('/')}}/site/css/hover.css">
    <link rel="stylesheet" href="{{url('/')}}/site/css/animate.css">
    <link rel="stylesheet" href="{{url('/')}}/site/css/flag.min.css">
    <link href="{{asset('toastr.min.css')}}" rel="stylesheet">



    <!-- Custom style  -->
    <link rel="stylesheet" href="{{url('/')}}/site/css/style.css">
    <!-- fonts  -->
    <link href="https://fonts.googleapis.com/css?family=Cairo&display=swap" rel="stylesheet">
</head>

<body>
<!-- ================ spinner ================= -->
<section class="spinner">
    <div class="sk-cube-grid">
        <div class="sk-cube sk-cube1"></div>
        <div class="sk-cube sk-cube2"></div>
        <div class="sk-cube sk-cube3"></div>
        <div class="sk-cube sk-cube4"></div>
        <div class="sk-cube sk-cube5"></div>
        <div class="sk-cube sk-cube6"></div>
        <div class="sk-cube sk-cube7"></div>
        <div class="sk-cube sk-cube8"></div>
        <div class="sk-cube sk-cube9"></div>
    </div>
</section>
<!-- ================ Navbar ================= -->
<section id="Header">
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
</section>
<!-- =============== register ================== -->
<section class="register" id="register">
    <div class="overlay2"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2 col-sm-1 col-0"></div>
            <div class="login-form col-lg-6 col-md-8 col-sm-10 col-12 text-center ">
                <div class="form-inner">
                    <!-- Material form login -->
                    <div class="card">

                        <h5 class="card-header red darken-2 white-text text-center py-4">
                            <strong>add account </strong>
                        </h5>

                        <!--Card content-->
                        <div class="card-body px-lg-5 pt-0">
                            <!-- Form -->
                            <form class="text-center" method="post" action="{{route('registerPost')}}">
                                  @csrf
                                <div class="form-row mt-2">
                                    <div class="col">
                                        <!-- First name -->
                                        <div class="md-form">
                                            <input type="text" id="name" name="name" class="form-control" value="{{old('name')}}">
                                            <label for="name">الاسم</label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <!-- phone number-->
                                        <div class="md-form">
                                            <input type="text" id="phone" name="phone" class="form-control" value="{{old('phone')}}">
                                            <label for="phone">رقم الهاتف</label>
                                        </div>
                                    </div>
                                </div>


                                <!-- Password -->
                                <div class="md-form mb-3">
                                    <input type="password" id="password" name='password'class="form-control ">
                                    <label for="user-password">كلمة المرور</label>
                                </div>
                                <div class="md-form mb-3">
                                    <input type="text" id="email" name="email" class="form-control" value="{{old('email')}}">
                                    <label for="phone">البريد الالكتلروني</label>
                                </div>

                                <select name="conuntry_id" class="mdb-select md-form colorful-select dropdown-primary"
                                        searchable="ابحث هنا">
                                    <option value="" disabled selected>الدولة</option>
                                    @foreach($countries as $country)
                                    <option  value="{{$country->id}}">{{$country->ar_title}}</option>
                                   @endforeach
                                </select>

                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" >
                                    <label class="form-check-label" for="Remember">اوافق علي الشروط والاحكام</label>
                                </div>
                                <!-- Sign in button -->
                                <button class="btn btn-outline-primary btn-rounded w-50 my-4 waves-effect z-depth-0"
                                        type="submit">تسجيل</button>





                                </div>


                                <!-- Register -->
                                <p>لديك حساب بالفعل ؟
                                    <a href="{{url('/terms')}}">الشروط
                                        <br>
                                    <a href="{{route('login')}}">تسجيل الدخول</a>
                                </p>

                            </form>
                            <!-- Form -->
                        </div>

                    </div>
                    <!-- Material form login -->

                </div>
            </div>
            <div class="col-lg-3 col-md-2 col-sm-1 col-0"></div>
        </div>
    </div>
</section>
<!-- =============== footer ================== -->
<!-- <div id="Footer"></div> -->









<!--////////////////////////////////////////////////////////////////////////////////-->
<!--////////////////////////////////////////////////////////////////////////////////-->
<!--////////////////////////////////////////////////////////////////////////////////-->
<!--/////////////////////////////JavaScript/////////////////////////////////////////-->
<!--////////////////////////////////////////////////////////////////////////////////-->
<!--////////////////////////////////////////////////////////////////////////////////-->
<!--////////////////////////////////////////////////////////////////////////////////-->
<script src="{{url('/')}}/site/js/jquery-3.4.1.min.js"></script>
<script src="{{url('/')}}/site/js/popper.min.js"></script>
<script src="{{url('/')}}/site/js/bootstrap.min.js"></script>
<script src="{{url('/')}}/site/js/mdb.min.js"></script>
<script src="{{url('/')}}/site/js/smooth-scroll.min.js"></script>
<script src="{{url('/')}}/site/js/owl.carousel.min.js"></script>
<script src="{{url('/')}}/site/js/wow.min.js"></script>
<script src="{{url('/')}}/site/js/flag.min.js"></script>
<script src="{{url('/')}}/site/js/Custom.js"></script>
<script src="{{asset('toastr.min.js')}}"></script>

<script>
    $('#Header').load("Header.html");
    // $('#Footer').load("Footer.html");
</script>

</body>

</html>
