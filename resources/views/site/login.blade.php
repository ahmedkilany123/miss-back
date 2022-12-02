<!doctype html>
<html lang="ar">

<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> missaing people</title>
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
    <link href="{{asset('admin/plugins/toast-master/css/jquery.toast.css')}}" rel="stylesheet">
    <!--alerts CSS -->
    <link href="{{asset('admin/plugins/sweetalert/sweetalert.css')}}" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="{{url('/')}}/site/css/hover.css">
    <link rel="stylesheet" href="{{url('/')}}/site/css/animate.css">
    <link rel="stylesheet" href="{{url('/')}}/site/css/flag.min.css">
    <link href="{{asset('toastr.min.css')}}" rel="stylesheet">



    <!-- Custom style  -->
    <link rel="stylesheet" href="{{url('/')}}/site/css/style.css">
    <!-- fonts  -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Cairo&display=swap" rel="stylesheet">
</head>

<body>
<!-- ================ spinner ================= -->
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

{{--
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
--}}
<!-- ================ Navbar ================= -->
<!-- =============== login ================== -->
<section class="login" id="login">
    <div class="overlay2"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2 col-sm-1 col-0"></div>
            <div class="login-form col-lg-6 col-md-8 col-sm-10 col-12 text-center">
                <div class="form-inner">
                    <!-- Material form login -->
                    <div class="card">

                        <h5 class="card-header green darken-2 white-text text-center py-4">
                            <strong>login</strong>
                        </h5>

                        <!--Card content-->
                        <div class="card-body px-lg-5 pt-0">

                            <!-- Form -->
                            <form class="text-center" method="post" action="{{ route('loginSitePost') }}">
                            @csrf
                            <!-- phone -->
                                <div class="md-form">
                                    <input type="text" id="phone" name="phone" class="form-control mb-3 " value="{{old('phone')}}">
                                    <label for="phone-number">رقم الهاتف او اسم المستخدم</label>
                                </div>

                                <!-- Password -->
                                <div class="md-form">
                                    <input type="password" id="password" name="password" class="form-control mb-4">
                                    <label for="password">كلمة المرور</label>
                                </div>

                                <div class="d-flex justify-content-around">
                                    <div>
                                        <!-- Remember me -->
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                                            <label class="form-check-label" for="Remember">تذكرني</label>
                                        </div>
                                    </div>
                                    <div>
                                        <!-- Forgot password -->

                                    </div>
                                </div>

                                <!-- Sign in button -->
                                <button
                                    class="btn btn-outline-primary btn-rounded  w-50 mt-4 waves-effect z-depth-0"
                                    type="submit">الدخول</button>
                                <!--

                                </div>

                            </form>
                        </div>



                        <!-- Register -->
                        <p>مستخدم جديد ؟
                            <a href="{{route('register')}}">إضافة حساب</a>
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
<script src="{{asset('admin/plugins/toast-master/js/jquery.toast.js')}}"></script>
<!-- Sweet-Alert  -->
<script src="{{asset('admin/plugins/sweetalert/sweetalert.min.js')}}"></script>
<script src="{{asset('toastr.min.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>


<script>
    $('#Header').load("Header.html");
    // $('#Footer').load("Footer.html");/
</script>

</body>
@toastr_render

</html>
