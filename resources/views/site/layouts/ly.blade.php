<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="{{asset('/style.css')}}">
    <title>My Website</title>
</head>

<body>
<!-- Header -->
<section id="header">
    <div class="header container">
        <div class="nav-bar">
            <div class="brand">
                <a href="#hero">
                    <h1><span>F</span>ind <span>M</span>issing</h1>
                </a>
            </div>
            <div class="nav-list">
                <div class="hamburger">
                    <div class="bar"></div>
                </div>
                <ul>
                @if(Auth::check())
                        <li class="nav-item">
                            <a class="nav-link " href="#">{{auth()->user()->name}}</a>
                        </li>
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#staticBackdrop">
 add missing
</button>
<li class="nav-item">
                            <a class="nav-link " href="{{route('logout')}}">logout</a>
                        </li>
                    @else
                        <li class="nav-item">
                            <a class="nav-link " href="{{route('login')}}">login</a>
                        </li>

                    @endif
                    <li><a href="#hero" data-after="Home">Home</a></li>
                    <li><a href="#services" data-after="Service">Services</a></li>
                    <li><a href="#missing" data-after="missing">missing</a></li>
                    <li><a href="#about" data-after="About">About</a></li>
                    <li><a href="#contact" data-after="Contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- End Header -->


<!-- Hero Section  -->
<section id="hero">
    <div class="hero container">
        <div>
            <h1>We here to find <span></span></h1>
            <h1>  <span></span></h1>
            <h1>missing people <span></span></h1>
            <a href="#missing" type="button" class="cta">missing section</a>
        </div>
    </div>
</section>
<!-- End Hero Section  -->

<!-- Service Section -->
<section id="services">
    <div class="services container">
        <div class="service-top">
            <h1 class="section-title">Serv<span>i</span>ces</h1>
            <p>The site aims to find the missing and easily search and announce them
            </p>
        </div>
        <div class="service-bottom">
            <div class="service-item">
                <div class="icon"><img src="https://img.icons8.com/bubbles/100/000000/services.png" /></div>
                <h2>Missing persons information
                </h2>
                <p>Ease of finding all the data of the missing to identify them easily and to know their whereabouts if someone tells about them          </p>
            </div>
            <div class="service-item">
                <div class="icon"><img src="https://img.icons8.com/bubbles/100/000000/services.png" /></div>
                <h2>Easey search
                </h2>
                <p> The ability to search for people by specifying a geographical area to narrow the search results and reach the desired results easily instead of using the general search

                </p>
            </div>
            <div class="service-item">
                <div class="icon"><img src="https://img.icons8.com/bubbles/100/000000/services.png" /></div>
                <h2>Post a poster
                </h2>
                <p>You can also publish a poster about a missing person that you would like to search for by attaching his photo, data, place of residence, and date of disappearance
                </p>
            </div>
            <div class="service-item">
                <div class="icon"><img src="https://img.icons8.com/bubbles/100/000000/services.png" /></div>
                <h2>missing</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis debitis rerum, magni voluptatem sed
                    architecto placeat beatae tenetur officia quod</p>
            </div>
        </div>
    </div>
</section>
<!-- End Service Section -->

<!-- missing Section -->
<section id="missing">
    <div class="missing container">
        <div class="missing-header">
            <h1 class="section-title">Recent <span>missing</span></h1>
        </div>
        <div class="all-missing">
            <div class="missing-item">
                <div class="missing-info">
                    <h1>missing 1</h1>
                    <h2>Coding is Love</h2>
                    <p>حمد محمد عبد الحميد المغربي
                        #مريض_نفسيا مشخص بالفصام
                        السن 39 سنه
                        متغيب من 24/11/2022
                        شبين الكوم #المنوفية
                        للتواصل
                        01003288851
                        01000844963</p>
                </div>
                <div class="missing-img">
                    <img src="{{url('/')}}/img/1.jpg" alt="img">
                </div>
            </div>
            <div class="missing-item">
                <div class="missing-info">
                    <h1>missing 2</h1>
                    <h2>Coding is Love</h2>
                    <p>#نبحث_عن_أهله
                        شاب #مريض_نفسيا
                        ده قاعد ورا سوق الجمله ٦ أكتوبر عند دار مصر ع الشارع #الجيزة 29/11/2022</p>
                </div>
                <div class="missing-img">
                    <img src="{{url('/')}}/img/2.jpg" alt="img">
                </div>
            </div>
            <div class="missing-item">
                <div class="missing-info">
                    <h1>missing 3</h1>
                    <h2>Coding is Love</h2>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad, iusto cupiditate voluptatum impedit unde
                        rem ipsa distinctio illum quae mollitia ut, accusantium eius odio ducimus illo neque atque libero non sunt
                        harum? Ipsum repellat animi, fugit architecto voluptatum odit et!</p>
                </div>
                <div class="missing-img">
                    <img src="{{url('/')}}/img/3.jpg" alt="img">
                </div>
            </div>
            <div class="missing-item">
                <div class="missing-info">
                    <h1>missing 4</h1>
                    <h2>Coding is Love</h2>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad, iusto cupiditate voluptatum impedit unde
                        rem ipsa distinctio illum quae mollitia ut, accusantium eius odio ducimus illo neque atque libero non sunt
                        harum? Ipsum repellat animi, fugit architecto voluptatum odit et!</p>
                </div>
                <div class="missing-img">
                    <img src="{{url('/')}}/img/4.webp" alt="img">
                </div>
            </div>
            <div class="missing-item">
                <div class="missing-info">
                    <h1>missing 5</h1>
                    <h2>Coding is Love</h2>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad, iusto cupiditate voluptatum impedit unde
                        rem ipsa distinctio illum quae mollitia ut, accusantium eius odio ducimus illo neque atque libero non sunt
                        harum? Ipsum repellat animi, fugit architecto voluptatum odit et!</p>
                </div>
                <div class="missing-img">
                    <img src="{{url('/')}}/img/5.png.crdownload" alt="img">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End missing Section -->
<!-- start cat -->


<div class="categories" id="categories">
    <div class="cont">
        <div class="main-heading">
            <h2>cities</h2>
            <p>
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Earum hic quo facere nostrum laboriosam, aperiam ipsa illo omnis, dignissimos iure aspernatur quam eaque et officiis voluptatum, quos porro eligendi. Id?

            </p>
        </div>
        <div class="input">
            <input list="front">
            <datalist id="front">
                @if($cities->count()> 0)
                   
                    @foreach($cities as $city)

                <option  ><a href='{{route("siteHome.show", $city->id)}}' {{$city->ar_title}} </option>


                    @endforeach
                     
                    
                @endif
            </datalist>
        </div><br>
        <ul class="shuffle">
            @if($cities->count() > 0)
             
                @foreach($cities as $city)
          <li class="active d-inline">  <a href='{{route("siteHome.show", $city->id)}}' class="btn btn-sm" >{{$city->ar_title}}</a></li>

                @endforeach
             
                @endif
      
    </div>
    </div>
    <div class="imgs-container">
        @if($missings->count() > 0)
            @foreach($missings as $m)
        <div class="box">
            @if(!$m->image)
            <img src="{{url('/')}}/img/miss.webp" alt="photo" />
            @else
                <img src="{{url('/' .$m->image)}}" alt="photo" />

            @endif
            <div class="caption">

                <h2>{{$m->name}} </h2>
                <h3>{{$m->phone}} </h3>
                <h3>{{$m->missing}} </h3>
                <p>{{$m->info}} </p>
            </div>
        </div>
            @endforeach
        @endif

    </div>

</div>

<!-- end cat -->
<!-- About Section -->
<section id="about">
    <div class="about container">
        <div class="col-left">
            <div class="about-img">
                <img src="{{url('/')}}/img/img-2.png" alt="img">
            </div>
        </div>
        <div class="col-right">
            <h1 class="section-title">About <span>us</span></h1>
            <h2>We are youths aiming for reunion</h2>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Asperiores, velit alias eius non illum beatae atque
                repellat ratione qui veritatis repudiandae adipisci maiores. At inventore necessitatibus deserunt
                exercitationem cumque earum omnis ipsum rem accusantium quis, quas quia, accusamus provident suscipit magni!
                Expedita sint ad dolore, commodi labore nihil velit earum ducimus nulla quae nostrum fugit aut, deserunt
                reprehenderit libero enim!</p>
            <a href="#contact" class="cta">contact us</a>
        </div>
    </div>
</section>
<!-- End About Section -->

<!-- add comment -->
<form class="form">
    <h5>Add Comment</h5><br><br>
    name:<input type="text" id="name" /> <br><br>
    date :  <input type="date" id="date" /> <br><br>
    body:<br><textarea rows="5" col="30" id="bodyText" ></textarea> <br/><br/>
    <input type="button" id="addcoment" value="addcoment">
</form>


<!-- add comment -->


<!-- Contact Section -->
<section id="contact">
    <div class="contact container">
        <div>
            <h1 class="section-title">Contact <span>info</span></h1>
        </div>
        <div class="contact-items">
            <div class="contact-item">
                <div class="icon"><img src="https://img.icons8.com/bubbles/100/000000/phone.png" /></div>
                <div class="contact-info">
                    <h1>Phone</h1>
                    <h2>+1 234 123 1234</h2>
                    <h2>+1 234 123 1234</h2>
                </div>
            </div>
            <div class="contact-item">
                <div class="icon"><img src="https://img.icons8.com/bubbles/100/000000/new-post.png" /></div>
                <div class="contact-info">
                    <h1>Email</h1>
                    <h2>info@gmail.com</h2>
                    <h2>abcd@gmail.com</h2>
                </div>
            </div>
            <div class="contact-item">
                <div class="icon"><img src="https://img.icons8.com/bubbles/100/000000/map-marker.png" /></div>
                <div class="contact-info">
                    <h1>Address</h1>
                    <h2>Egypt</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Contact Section -->
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade    " id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">add missing</h5>

      </div>
      <div class="modal-body">
          <form method="post" action="{{route('siteCategories.store')}}">
              @csrf
              <div class="form-group">

                  <label for="name">namme</label>
                  <input type="text" id="name" value="unkown" name="name" class="form-control" value="{{old('name')}}">


              </div>
              <div class="form-group">                                        <!-- phone number-->

                  <label for="phone">phone </label>
                  <input type="text" id="phone" required name="phone" class="form-control" value="{{old('phone')}}">



              </div>
              <div class="form-group">
                  <label for="exampleFormControlInput1">Email address</label>
                  <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
              </div>
              <div class="form-group">
                  <label for="exampleFormControlSelect1">founded/missing select</label>
                  <select class="form-control" required namme='missing' id="exampleFormControlSelect1">
                      <option  value='founded'  >founded</option>
                      <option value='missing'>missing</option>

                  </select>
              </div>
              <div class="form-group">
                  <div class="md-form">
                      <input required type="file" id="photo" name="image" class="form-control" value=''>
                      <label  for='image' >image </label>
                  </div>
              </div>
              <div class="form-group">
                  <label for="exampleFormControlTextarea1">info</label>
                  <textarea class="form-control" required name="info" id="exampleFormControlTextarea1" rows="3"></textarea>
              </div>
              <select class="form-control" required name="city_id" class="mdb-select md-form colorful-select dropdown-primary"
                      searchable="ابحث هنا">
                  <option value="" disabled selected>citty</option>
                  @foreach($countries as $country)
                      <option  value="{{$country->id}}">{{$country->ar_title}}</option>
                  @endforeach
              </select>


              <!-- Sign in button -->
              <button class="btn btn-outline-primary btn-rounded w-50  waves-effect z-depth-0"
                      type="submit">add</button>





          </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>
<!-- Footer -->
<section id="footer">
    <div class="footer container">
        <div class="brand">
            <h1><span>F</span>ind <span>M</span>issing</h1>
        </div>
        <h2>We are youth aiming for reunion</h2>
        <div class="social-icon">
            <div class="social-item">
                <a href="#"><img src="https://img.icons8.com/bubbles/100/000000/facebook-new.png" /></a>
            </div>
            <div class="social-item">
                <a href="#"><img src="https://img.icons8.com/bubbles/100/000000/instagram-new.png" /></a>
            </div>

            <div class="social-item">
                <a href="#"><img src="https://img.icons8.com/bubbles/100/000000/behance.png" /></a>
            </div>
        </div>
        <p>Copyright © 2020 missing. All rights reserved</p>
    </div>
</section>
<!-- End Footer -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="{{asset('app.js')}}"></script>
</body>

</html>
