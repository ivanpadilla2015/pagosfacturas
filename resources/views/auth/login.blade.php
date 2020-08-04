@extends('layouts.app')

<style>

* {
  box-sizing: border-box;
    margin:0px auto;

  &:before,
  &:after {
    box-sizing: border-box;
  }

}
    .backg {
                background: #0264d6; /* Old browsers */
                background: -moz-radial-gradient(center, ellipse cover,  #0264d6 1%, #1c2b5a 100%); /* FF3.6+ */
                background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(1%,#0264d6), color-stop(100%,#1c2b5a)); /* Chrome,Safari4+ */
                background: -webkit-radial-gradient(center, ellipse cover,  #0264d6 1%,#1c2b5a 100%); /* Chrome10+,Safari5.1+ */
                background: -o-radial-gradient(center, ellipse cover,  #0264d6 1%,#1c2b5a 100%); /* Opera 12+ */
                background: -ms-radial-gradient(center, ellipse cover,  #0264d6 1%,#1c2b5a 100%); /* IE10+ */
                background: radial-gradient(ellipse at center,  #0264d6 1%,#1c2b5a 100%); /* W3C */
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0264d6', endColorstr='#1c2b5a',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
                height:calc(100vh);
                width:100%;
            }
  p {
	line-height: 1.5em;
 }

 body {
  color: #606468;
 font: 87.5%/1.5em 'Open Sans', sans-serif;
 margin: 0;
}



 input {
	border: none;
	font-family: 'Open Sans', Arial, sans-serif;
	font-size: 14px;
	line-height: 1.5em;
	padding: 0;
	-webkit-appearance: none;
}
#login form{
	width: 250px;
}
#login, .logo{
    display:inline-block;
    width:40%;
}
#login{
border-right:1px solid #fff;
  padding: 0px 22px;
  width: 59%;
}

.logo{
color:#fff;
font-size:50px;
  line-height: 125px;
}

#login form span.fa {
	background-color: #fff;
	border-radius: 3px 0px 0px 3px;
	color: #000;
	display: block;
	float: left;
	height: 50px;
    font-size:24px;
	line-height: 50px;
	text-align: center;
	width: 50px;
}

#login form input {
	height: 50px;
}
fieldset{
    padding:0;
    border:0;
    margin: 0;

}
#login form input[type="email"], input[type="password"] {
	background-color: #fff;
	border-radius: 0px 3px 3px 0px;
	color: #000;
	margin-bottom: 1em;
	padding: 0 16px;
	width: 200px;
}

#login form input[type="submit"] {
  border-radius: 3px;
  -moz-border-radius: 3px;
  -webkit-border-radius: 3px;
  background-color: #000000;
  color: #eee;
  font-weight: bold;
  /* margin-bottom: 2em; */
  text-transform: uppercase;
  padding: 5px 10px;
  height: 30px;
}

fieldset{
    padding:0;
    border:0;
    margin: 0;

}

#login form input[type="submit"]:hover {
	background-color: #d44179;
}

#login > p {
	text-align: center;
}

#login > p span {
	padding-left: 5px;
}

.middle {
  display: flex;
  width: 600px;
}

.clearfix {
  *zoom: 1;

  &:before,
  &:after {
    content: ' ';
    display: table;
  }

</style>

@section('content')
<div class="container " >
    <div class="row justify-content-center">
       
        <div class="middle">   
            <div id="login">
               
                    <form method="POST" action="{{ route('login') }}">
                        @csrf
                        <fieldset class="clearfix">
                            <p ><span class="fa fa-user"></span><input  type="email"  name="email" value="{{ old('email') }}" placeholder="Correo" required autocomplete="email" autofocus></p>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                             <p><span class="fa fa-lock"></span><input  type="password"  name="password" placeholder="Contraseña" required autocomplete="current-password"></p>

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror

                                <span style="width:48%; text-align:left;  display: inline-block;">
                                    @if (Route::has('password.request')) 
                                       <a class="small-text" href="{{ route('password.request') }}">¿Olvidaste tu contraseña?</a>
                                    @endif
                                </span>
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Login') }}
                                </button>
                        </fieldset>
                        <div class="clearfix"></div>
                    </form>

                    <div class="clearfix"></div>
            </div>  <!-- login   -->
            <div class="logo ml-5">RG.NORTE
                                        
                <div class="clearfix"></div>
            </div>
        </div>
       
    </div>
</div>
@endsection
