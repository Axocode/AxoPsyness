<%-- 
    Document   : dashboard.jsp
    Created on : 26 feb. 2024, 00:13:01
    Author     : admin
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
       <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Socialite is - Professional A unique and beautiful collection of UI elements">
        <title>Dashboard - Psyness</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>


            <!-- Favicon -->
        <link href="../assets/images/Icono.svg" rel="icon" type="image/png">


            <!-- icons ================================================== -->
        <link rel="stylesheet" href="../assets/css/icons.css">

            <!-----Boxicons------->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

            <!-----Bootstrap------->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
       
            <!-----Fontawesome------->
        <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
            <!-----JQuery------->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    
            <!-- CSS ================================================== --> 


        <!-- ====================    NUEVOS ASSETS          ============================== --> 

           <!-- Fonts -->
           <link rel="preconnect" href="https://fonts.googleapis.com">
           <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
           <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">
       
           <!-- Icons -->
           <link rel="stylesheet" href="../../assets/vendor/fonts/boxicons.css">
           <link rel="stylesheet" href="../../assets/vendor/fonts/fontawesome.css">
           <link rel="stylesheet" href="../../assets/vendor/fonts/flag-icons.css">
       
           <!-- Core CSS -->
           
           <link rel="stylesheet" href="../assets/vendor/demo.css">
           
           <!-- Vendors CSS -->
           <link rel="stylesheet" href="../assets/vendor/perfect-scrollbar.css">
           <link rel="stylesheet" href="../assets/vendor/typeahead.css"> 
           <link rel="stylesheet" href="../assets/vendor/apex-charts.css">
       
           <!-- Page CSS -->
           
       
           <!-- Helpers -->
           <script src="../../assets/vendor/js/helpers.js"></script>


           <style type="text/css">
            .layout-menu-fixed .layout-navbar-full .layout-menu,
            .layout-menu-fixed-offcanvas .layout-navbar-full .layout-menu {
              top: 62px !important;
            }
            .layout-page {
              padding-top: 62px !important;
            }
            .content-wrapper {
              padding-bottom: 46.04999923706055px !important;
            }</style>


                <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
                <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
                <script src="../../assets/vendor/js/template-customizer.js"></script>
                <style>#template-customizer{font-family:"Open Sans",BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol" !important;font-size:inherit !important;position:fixed;top:0;right:0;height:100%;z-index:99999999;display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-orient:vertical;-webkit-box-direction:normal;-ms-flex-direction:column;flex-direction:column;width:400px;background:#fff;-webkit-box-shadow:0 0 20px 0 rgba(0,0,0,.2);box-shadow:0 0 20px 0 rgba(0,0,0,.2);-webkit-transition:all .2s ease-in;-o-transition:all .2s ease-in;transition:all .2s ease-in;-webkit-transform:translateX(420px);-ms-transform:translateX(420px);transform:translateX(420px)}#template-customizer h5{position:relative;font-size:11px}#template-customizer>h5{flex:0 0 auto}#template-customizer .disabled{color:#d1d2d3 !important}#template-customizer .form-label{font-size:.9375rem}#template-customizer .form-check-label{font-size:.8125rem}#template-customizer .template-customizer-t-panel_header{font-size:1.125rem}#template-customizer.template-customizer-open{-webkit-transition-delay:.1s;-o-transition-delay:.1s;transition-delay:.1s;-webkit-transform:none !important;-ms-transform:none !important;transform:none !important}#template-customizer.template-customizer-open .custom-option.checked{color:var(--bs-primary);border-width:2px}#template-customizer.template-customizer-open .custom-option.checked .custom-option-content{border:none}#template-customizer.template-customizer-open .custom-option .custom-option-content{border:1px solid rgba(0,0,0,0)}#template-customizer .template-customizer-header a:hover{color:inherit !important}#template-customizer .template-customizer-open-btn{position:absolute;top:180px;left:0;z-index:-1;display:block;width:42px;height:42px;border-top-left-radius:15%;border-bottom-left-radius:15%;background:var(--bs-primary);color:#fff !important;text-align:center;font-size:18px !important;line-height:42px;opacity:1;-webkit-transition:all .1s linear .2s;-o-transition:all .1s linear .2s;transition:all .1s linear .2s;-webkit-transform:translateX(-62px);-ms-transform:translateX(-62px);transform:translateX(-62px)}@media(max-width: 991.98px){#template-customizer .template-customizer-open-btn{top:145px}}.dark-style #template-customizer .template-customizer-open-btn{background:var(--bs-primary)}#template-customizer .template-customizer-open-btn::before{content:"";width:22px;height:22px;display:block;background-size:100% 100%;position:absolute;background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAABClJREFUaEPtmY1RFEEQhbsjUCIQIhAiUCNQIxAiECIQIxAiECIAIpAMhAiECIQI2vquZqnZvp6fhb3SK5mqq6Ju92b69bzXf6is+dI1t1+eAfztG5z1BsxsU0S+ici2iPB3vm5E5EpEDlSVv2dZswFIxv8UkZcNy+5EZGcuEHMCOBeR951uvVDVD53vVl+bE8DvDu8Pxtyo6ta/BsByg1R15Bwzqz5/LJgn34CZwfnPInI4BUB6/1hV0cSjVxcAM4PbcBZjL0XklIPN7Is3fLCkdQPpPYw/VNXj5IhPIvJWRIhSl6p60ULWBGBm30Vk123EwRxCuIzWkkjNrCZywith10ewE1Xdq4GoAjCz/RTXW44Ynt+LyBEfT43kYfbj86J3w5Q32DNcRQDpwF+dkQXDMey8xem0L3TEqB4g3PZWad8agBMRgZPeu96D1/C2Zbh3X0p80Op1xxloztN48bMQQNoc7+eLEuAoPSPiIDY4Ooo+E6ixeNXM+D3GERz2U3CIqMstLJUgJQDe+7eq6mub0NYEkLAKwEHkiBQDCZtddZCZ8d6r7JDwFkoARklHRPZUFVDVZWbwGuNrC4EfdOzFrRABh3Wnqhv+d70AEBLGFROPmeHlnM81G69UdSd6IUuM0GgUVn1uqWmg5EmMfBeEyB7Pe3txBkY+rGT8j0J+WXq/BgDkUCaqLgEAnwcRog0veMIqFAAwCy2wnw+bI2GaGboBgF9k5N0o0rUSGUb4eO0BeO9j/GYhkSHMHMTIqwGARX6p6a+nlPBl8kZuXMD9j6pKfF9aZuaFOdJCEL5D4eYb9wCYVCanrBmGyii/tIq+SLj/HQBCaM5bLzwfPqdQ6FpVHyra4IbuVbXaY7dETC2ESPNNWiIOi69CcdgSMXsh4tNSUiklMgwmC0aNd08Y5WAES6HHehM4gu97wyhBgWpgqXsrASglprDy7CwhehMZOSbK6JMSma+Fio1KltCmlBIj7gfZOGx8ppQSXrhzFnOhJ/31BDkjFHRvOd09x0mRBA9SFgxUgHpQg0q0t5ymPMlL+EnldFTfDA0NAmf+OTQ0X0sRouf7NNkYGhrOYNrxtIaGg83MNzVDSe3LXLhP7O/yrCsCz1zlWTpjWkuZAOBpX3yVnLqI1yLCOKU6qMrmP7SSrUEw54XF4WBIK5FxCMOr3lVsfGqNSmPzBXUnJTIX1jyVBq9wO6UObOpgC5GjO98vFKnTdQMZXxEsWZlDiCZMIxAbNxQOqlpVZtobejBaZNoBnRDzMFpkxvTQOD36BlrcySZuI6p1ACB6LU3wWuf5581+oHfD1vi89bz3nFUC8Nm7ZlP3nKkFbM4bWPt/MSFwklprYItwt6cmvpWJ2IVcQBCz6bLysSCv3SaANCiTsnaNRrNRqMXVVT1/BrAqz/buu/Y38Ad3KC5PARej0QAAAABJRU5ErkJggg==);margin:10px}.customizer-hide #template-customizer .template-customizer-open-btn{display:none}[dir=rtl] #template-customizer .template-customizer-open-btn{border-radius:0;border-top-right-radius:15%;border-bottom-right-radius:15%}[dir=rtl] #template-customizer .template-customizer-open-btn::before{margin-left:-2px}#template-customizer.template-customizer-open .template-customizer-open-btn{opacity:0;-webkit-transition-delay:0s;-o-transition-delay:0s;transition-delay:0s;-webkit-transform:none !important;-ms-transform:none !important;transform:none !important}#template-customizer .template-customizer-inner{position:relative;overflow:auto;-webkit-box-flex:0;-ms-flex:0 1 auto;flex:0 1 auto;opacity:1;-webkit-transition:opacity .2s;-o-transition:opacity .2s;transition:opacity .2s}#template-customizer .template-customizer-inner>div:first-child>hr:first-of-type{display:none !important}#template-customizer .template-customizer-inner>div:first-child>h5:first-of-type{padding-top:0 !important}#template-customizer .template-customizer-themes-inner{position:relative;opacity:1;-webkit-transition:opacity .2s;-o-transition:opacity .2s;transition:opacity .2s}#template-customizer .template-customizer-theme-item{display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-align:center;align-items:center;-ms-flex-align:center;-webkit-box-flex:1;-ms-flex:1 1 100%;flex:1 1 100%;-webkit-box-pack:justify;-ms-flex-pack:justify;justify-content:space-between;margin-bottom:10px;padding:0 24px;width:100%;cursor:pointer}#template-customizer .template-customizer-theme-item input{position:absolute;z-index:-1;opacity:0}#template-customizer .template-customizer-theme-item input~span{opacity:.25;-webkit-transition:all .2s;-o-transition:all .2s;transition:all .2s}#template-customizer .template-customizer-theme-item .template-customizer-theme-checkmark{display:inline-block;width:6px;height:12px;border-right:1px solid;border-bottom:1px solid;opacity:0;-webkit-transition:all .2s;-o-transition:all .2s;transition:all .2s;-webkit-transform:rotate(45deg);-ms-transform:rotate(45deg);transform:rotate(45deg)}[dir=rtl] #template-customizer .template-customizer-theme-item .template-customizer-theme-checkmark{border-right:none;border-left:1px solid;-webkit-transform:rotate(-45deg);-ms-transform:rotate(-45deg);transform:rotate(-45deg)}#template-customizer .template-customizer-theme-item input:checked:not([disabled])~span,#template-customizer .template-customizer-theme-item:hover input:not([disabled])~span{opacity:1}#template-customizer .template-customizer-theme-item input:checked:not([disabled])~span .template-customizer-theme-checkmark{opacity:1}#template-customizer .template-customizer-theme-colors span{display:block;margin:0 1px;width:10px;height:10px;border-radius:50%;-webkit-box-shadow:0 0 0 1px rgba(0,0,0,.1) inset;box-shadow:0 0 0 1px rgba(0,0,0,.1) inset}#template-customizer.template-customizer-loading .template-customizer-inner,#template-customizer.template-customizer-loading-theme .template-customizer-themes-inner{opacity:.2}#template-customizer.template-customizer-loading .template-customizer-inner::after,#template-customizer.template-customizer-loading-theme .template-customizer-themes-inner::after{content:"";position:absolute;top:0;right:0;bottom:0;left:0;z-index:999;display:block}@media(max-width: 1200px){#template-customizer{display:none;visibility:hidden !important}}@media(max-width: 575.98px){#template-customizer{width:300px;-webkit-transform:translateX(320px);-ms-transform:translateX(320px);transform:translateX(320px)}}.layout-menu-100vh #template-customizer{height:100vh}[dir=rtl] #template-customizer{right:auto;left:0;-webkit-transform:translateX(-420px);-ms-transform:translateX(-420px);transform:translateX(-420px)}[dir=rtl] #template-customizer .template-customizer-open-btn{right:0;left:auto;-webkit-transform:translateX(62px);-ms-transform:translateX(62px);transform:translateX(62px)}[dir=rtl] #template-customizer .template-customizer-close-btn{right:auto;left:0}#template-customizer .template-customizer-layouts-options[disabled]{opacity:.5;pointer-events:none}[dir=rtl] .template-customizer-t-style_switch_light{padding-right:0 !important}</style>  

 </head>

<body>
    <div id="wrapper">
                    <!-- Header -->
        <jsp:include page="sidebar.jsp"/>
        
       
        <div class="main_content">
            <div class="mcontainer">

                <div class="container-xxl flex-grow-1 container-p-y">
            
                    <div class="row">
                      <!-- Gamification Card -->
                      <div class="col-lg-4 col-md-6 col-12 mb-4">
                        <div class="card h-100">
                          <div class="card-header">
                            <h3 class="card-title mb-2">Congratulations John!</h3>
                            <span class="d-block mb-4 text-nowrap">Best seller of the month</span>
                          </div>
                          <div class="card-body">
                            <div class="row align-items-end">
                              <div class="col-6">
                                <h1 class="display-6 text-primary mb-2 pt-4 pb-1">$89k</h1>
                                <small class="d-block mb-3">You have done 57.6% <br>more sales today.</small>
                    
                                <a href="javascript:;" class="btn btn-sm btn-primary">View sales</a>
                              </div>
                              <div class="col-6">
                                <img src="../images/prize-light.png" width="140" height="150" class="rounded-start" alt="View Sales" data-app-light-img="illustrations/prize-light.png" data-app-dark-img="illustrations/prize-dark.png">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!--/ Gamification Card -->
                    
                      <!-- Multi Radial Chart -->
                      <div class="col-lg-4 col-md-6 col-12 mb-4">
                        <div class="card">
                          <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="card-title mb-0">Visits of 2022</h5>
                            <div class="dropdown">
                              <button class="btn p-0" type="button" id="visitsOptions" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="visitsOptions">
                                <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                <a class="dropdown-item" href="javascript:void(0);">Share</a>
                              </div>
                            </div>
                          </div>

                          <div class="card-body" style="position: relative;">
                            <div id="visitsRadialChart" style="min-height: 227.3px;">
                                <div id="apexchartsp2ko8vis" class="apexcharts-canvas apexchartsp2ko8vis apexcharts-theme-light" style="width: 255px; height: 227.3px;">
                                    <svg id="SvgjsSvg1693" width="255" height="227.30000038146974" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;">
                                        

                            <g id="SvgjsG1695" class="apexcharts-inner apexcharts-graphical" transform="translate(12, -20)"><defs id="SvgjsDefs1694"><clipPath id="gridRectMaskp2ko8vis"><rect id="SvgjsRect1697" width="239" height="229" x="-3" y="-1" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskp2ko8vis"></clipPath><clipPath id="nonForecastMaskp2ko8vis"></clipPath><clipPath id="gridRectMarkerMaskp2ko8vis"><rect id="SvgjsRect1698" width="237" height="231" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1699" class="apexcharts-radialbar"><g id="SvgjsG1700"><g id="SvgjsG1701" class="apexcharts-tracks"><g id="SvgjsG1702" class="apexcharts-radialbar-track apexcharts-track" rel="1"><path id="apexcharts-radialbarTrack-0" d="M 116.5 25.369207317073162 A 88.13079268292684 88.13079268292684 0 1 1 116.48461827503098 25.369208659381883" fill="none" fill-opacity="1" stroke="rgba(255,255,255,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="4.268591463414635" stroke-dasharray="0" class="apexcharts-radialbar-area" data:pathOrig="M 116.5 25.369207317073162 A 88.13079268292684 88.13079268292684 0 1 1 116.48461827503098 25.369208659381883"></path></g><g id="SvgjsG1704" class="apexcharts-radialbar-track apexcharts-track" rel="2"><path id="apexcharts-radialbarTrack-1" d="M 116.5 39.76981707317073 A 73.73018292682927 73.73018292682927 0 1 1 116.48713165556362 39.76981819614562" fill="none" fill-opacity="1" stroke="rgba(255,255,255,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="4.268591463414635" stroke-dasharray="0" class="apexcharts-radialbar-area" data:pathOrig="M 116.5 39.76981707317073 A 73.73018292682927 73.73018292682927 0 1 1 116.48713165556362 39.76981819614562"></path></g><g id="SvgjsG1706" class="apexcharts-radialbar-track apexcharts-track" rel="3"><path id="apexcharts-radialbarTrack-2" d="M 116.5 54.170426829268294 A 59.329573170731706 59.329573170731706 0 1 1 116.48964503609623 54.17042773290936" fill="none" fill-opacity="1" stroke="rgba(255,255,255,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="4.268591463414635" stroke-dasharray="0" class="apexcharts-radialbar-area" data:pathOrig="M 116.5 54.170426829268294 A 59.329573170731706 59.329573170731706 0 1 1 116.48964503609623 54.17042773290936"></path></g></g><g id="SvgjsG1708"><g id="SvgjsG1713" class="apexcharts-series apexcharts-radial-series" seriesName="Target" rel="1" data:realIndex="0"><path id="SvgjsPath1714" d="M 116.5 25.369207317073162 A 88.13079268292684 88.13079268292684 0 1 1 28.369207317073162 113.50000000000001" fill="none" fill-opacity="0.85" stroke="rgba(90,141,238,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="4.4006097560975626" stroke-dasharray="0" class="apexcharts-radialbar-area apexcharts-radialbar-slice-0" data:angle="270" data:value="75" index="0" j="0" data:pathOrig="M 116.5 25.369207317073162 A 88.13079268292684 88.13079268292684 0 1 1 28.369207317073162 113.50000000000001"></path></g><g id="SvgjsG1715" class="apexcharts-series apexcharts-radial-series" seriesName="Mart" rel="2" data:realIndex="1"><path id="SvgjsPath1716" d="M 116.5 39.76981707317073 A 73.73018292682927 73.73018292682927 0 1 1 46.37842907980534 90.71612047723613" fill="none" fill-opacity="0.85" stroke="rgba(255,91,92,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="4.4006097560975626" stroke-dasharray="0" class="apexcharts-radialbar-area apexcharts-radialbar-slice-1" data:angle="288" data:value="80" index="0" j="1" data:pathOrig="M 116.5 39.76981707317073 A 73.73018292682927 73.73018292682927 0 1 1 46.37842907980534 90.71612047723613"></path></g><g id="SvgjsG1717" class="apexcharts-series apexcharts-radial-series" seriesName="Ebay" rel="3" data:realIndex="2"><path id="SvgjsPath1718" d="M 116.5 54.170426829268294 A 59.329573170731706 59.329573170731706 0 1 1 68.50136703586611 78.62695186543672" fill="none" fill-opacity="0.85" stroke="rgba(253,172,65,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="4.4006097560975626" stroke-dasharray="0" class="apexcharts-radialbar-area apexcharts-radialbar-slice-2" data:angle="306" data:value="85" index="0" j="2" data:pathOrig="M 116.5 54.170426829268294 A 59.329573170731706 59.329573170731706 0 1 1 68.50136703586611 78.62695186543672"></path></g><circle id="SvgjsCircle1709" r="52.1952774390244" cx="116.5" cy="113.5" class="apexcharts-radialbar-hollow" fill="transparent"></circle><g id="SvgjsG1710" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)" style="opacity: 1;"><text id="SvgjsText1711" font-family="IBM Plex Sans" x="116.5" y="138.5" text-anchor="middle" dominant-baseline="auto" font-size="15px" font-weight="400" fill="#677788" class="apexcharts-text apexcharts-datalabel-label" style="font-family: &quot;IBM Plex Sans&quot;; fill: rgb(103, 119, 136);">Total Visits</text><text id="SvgjsText1712" font-family="Rubik" x="116.5" y="114.5" text-anchor="middle" dominant-baseline="auto" font-size="2rem" font-weight="500" fill="#516377" class="apexcharts-text apexcharts-datalabel-value" style="font-family: Rubik;">80%</text></g></g></g></g><line id="SvgjsLine1719" x1="0" y1="0" x2="233" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1720" x1="0" y1="0" x2="233" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG1696" class="apexcharts-annotations"></g></svg></div></div>
                          <div class="resize-triggers"><div class="expand-trigger"><div style="width: 300px; height: 250px;"></div></div><div class="contract-trigger"></div></div></div>
                        </div>
                      </div>
                      <!--/ Multi Radial Chart -->
                    
                      <!-- Statistics cards & Revenue Growth Chart -->
                      <div class="col-lg-4 col-12">
                        <div class="row">
                          <!-- Statistics Cards -->
                          <div class="col-6 col-md-3 col-lg-6 mb-4">
                            <div class="card h-100">
                              <div class="card-body text-center">
                                <div class="avatar mx-auto mb-2">
                                  <span class="avatar-initial rounded-circle bg-label-success"><i class="bx bx-purchase-tag fs-4"></i></span>
                                </div>
                                <span class="d-block text-nowrap">Purchase</span>
                                <h2 class="mb-0">65</h2>
                              </div>
                            </div>
                          </div>
                          <div class="col-6 col-md-3 col-lg-6 mb-4">
                            <div class="card h-100">
                              <div class="card-body text-center">
                                <div class="avatar mx-auto mb-2">
                                  <span class="avatar-initial rounded-circle bg-label-danger"><i class="bx bx-cart fs-4"></i></span>
                                </div>
                                <span class="d-block text-nowrap">Order</span>
                                <h2 class="mb-0">40</h2>
                              </div>
                            </div>
                          </div>


                          <!--/ Statistics Cards -->
                          <!-- Revenue Growth Chart -->
                          <div class="col-12 col-md-6 col-lg-12 mb-4">
                            <div class="card">
                              <div class="card-header d-flex justify-content-between align-items-center pb-0">
                                <h5 class="card-title mb-0">Revenue Growth</h5>
                                <span>$25,980</span>
                              </div>
                              <div class="card-body pb-0" style="position: relative;">
                                <div id="revenueGrowthChart" style="min-height: 105px;"><div id="apexchartsbng5yuq1" class="apexcharts-canvas apexchartsbng5yuq1 apexcharts-theme-light" style="width: 255px; height: 90px;"><svg id="SvgjsSvg1721" width="255" height="90" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1723" class="apexcharts-inner apexcharts-graphical" transform="translate(0, 10)"><defs id="SvgjsDefs1722"><linearGradient id="SvgjsLinearGradient1726" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop1727" stop-opacity="0.4" stop-color="rgba(216,227,240,0.4)" offset="0"></stop><stop id="SvgjsStop1728" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop><stop id="SvgjsStop1729" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop></linearGradient><clipPath id="gridRectMaskbng5yuq1"><rect id="SvgjsRect1731" width="259" height="62.995199382781976" x="-2" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskbng5yuq1"></clipPath><clipPath id="nonForecastMaskbng5yuq1"></clipPath><clipPath id="gridRectMarkerMaskbng5yuq1"><rect id="SvgjsRect1732" width="259" height="66.99519938278198" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><rect id="SvgjsRect1730" width="3" height="62.995199382781976" x="201" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke-dasharray="3" fill="url(#SvgjsLinearGradient1726)" class="apexcharts-xcrosshairs" y2="62.995199382781976" filter="none" fill-opacity="0.9" x1="201" x2="201"></rect><g id="SvgjsG1772" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1773" class="apexcharts-xaxis-texts-g" transform="translate(0, -9)"><text id="SvgjsText1775" font-family="Helvetica, Arial, sans-serif" x="7.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1776">10</tspan><title>10</title></text><text id="SvgjsText1778" font-family="Helvetica, Arial, sans-serif" x="22.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1779"></tspan><title></title></text><text id="SvgjsText1781" font-family="Helvetica, Arial, sans-serif" x="37.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1782"></tspan><title></title></text><text id="SvgjsText1784" font-family="Helvetica, Arial, sans-serif" x="52.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1785"></tspan><title></title></text><text id="SvgjsText1787" font-family="Helvetica, Arial, sans-serif" x="67.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1788"></tspan><title></title></text><text id="SvgjsText1790" font-family="Helvetica, Arial, sans-serif" x="82.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1791"></tspan><title></title></text><text id="SvgjsText1793" font-family="Helvetica, Arial, sans-serif" x="97.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1794"></tspan><title></title></text><text id="SvgjsText1796" font-family="Helvetica, Arial, sans-serif" x="112.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1797"></tspan><title></title></text><text id="SvgjsText1799" font-family="Helvetica, Arial, sans-serif" x="127.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1800">15</tspan><title>15</title></text><text id="SvgjsText1802" font-family="Helvetica, Arial, sans-serif" x="142.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1803"></tspan><title></title></text><text id="SvgjsText1805" font-family="Helvetica, Arial, sans-serif" x="157.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1806"></tspan><title></title></text><text id="SvgjsText1808" font-family="Helvetica, Arial, sans-serif" x="172.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1809"></tspan><title></title></text><text id="SvgjsText1811" font-family="Helvetica, Arial, sans-serif" x="187.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1812"></tspan><title></title></text><text id="SvgjsText1814" font-family="Helvetica, Arial, sans-serif" x="202.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1815"></tspan><title></title></text><text id="SvgjsText1817" font-family="Helvetica, Arial, sans-serif" x="217.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1818"></tspan><title></title></text><text id="SvgjsText1820" font-family="Helvetica, Arial, sans-serif" x="232.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1821"></tspan><title></title></text><text id="SvgjsText1823" font-family="Helvetica, Arial, sans-serif" x="247.5" y="86.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1824">20</tspan><title>20</title></text></g></g><g id="SvgjsG1826" class="apexcharts-grid"><g id="SvgjsG1827" class="apexcharts-gridlines-horizontal" style="display: none;"><line id="SvgjsLine1829" x1="0" y1="0" x2="255" y2="0" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1830" x1="0" y1="15.748799845695494" x2="255" y2="15.748799845695494" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1831" x1="0" y1="31.497599691390988" x2="255" y2="31.497599691390988" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1832" x1="0" y1="47.24639953708648" x2="255" y2="47.24639953708648" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1833" x1="0" y1="62.995199382781976" x2="255" y2="62.995199382781976" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line></g><g id="SvgjsG1828" class="apexcharts-gridlines-vertical" style="display: none;"></g><line id="SvgjsLine1835" x1="0" y1="62.995199382781976" x2="255" y2="62.995199382781976" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line><line id="SvgjsLine1834" x1="0" y1="1" x2="0" y2="62.995199382781976" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line></g><g id="SvgjsG1733" class="apexcharts-bar-series apexcharts-plot-series"><g id="SvgjsG1734" class="apexcharts-series" seriesName="2020" rel="1" data:realIndex="0"><path id="SvgjsPath1736" d="M 6 62.995199382781976L 6 39.79711962966918Q 6 37.79711962966918 8 37.79711962966918L 7 37.79711962966918Q 9 37.79711962966918 9 39.79711962966918L 9 39.79711962966918L 9 62.995199382781976Q 9 62.995199382781976 9 62.995199382781976L 6 62.995199382781976Q 6 62.995199382781976 6 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 6 62.995199382781976L 6 39.79711962966918Q 6 37.79711962966918 8 37.79711962966918L 7 37.79711962966918Q 9 37.79711962966918 9 39.79711962966918L 9 39.79711962966918L 9 62.995199382781976Q 9 62.995199382781976 9 62.995199382781976L 6 62.995199382781976Q 6 62.995199382781976 6 62.995199382781976z" pathFrom="M 6 62.995199382781976L 6 62.995199382781976L 9 62.995199382781976L 9 62.995199382781976L 9 62.995199382781976L 9 62.995199382781976L 9 62.995199382781976L 6 62.995199382781976" cy="37.79711962966918" cx="21" j="0" val="80" barHeight="25.19807975311279" barWidth="3"></path><path id="SvgjsPath1737" d="M 21 62.995199382781976L 21 46.096639567947385Q 21 44.096639567947385 23 44.096639567947385L 22 44.096639567947385Q 24 44.096639567947385 24 46.096639567947385L 24 46.096639567947385L 24 62.995199382781976Q 24 62.995199382781976 24 62.995199382781976L 21 62.995199382781976Q 21 62.995199382781976 21 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 21 62.995199382781976L 21 46.096639567947385Q 21 44.096639567947385 23 44.096639567947385L 22 44.096639567947385Q 24 44.096639567947385 24 46.096639567947385L 24 46.096639567947385L 24 62.995199382781976Q 24 62.995199382781976 24 62.995199382781976L 21 62.995199382781976Q 21 62.995199382781976 21 62.995199382781976z" pathFrom="M 21 62.995199382781976L 21 62.995199382781976L 24 62.995199382781976L 24 62.995199382781976L 24 62.995199382781976L 24 62.995199382781976L 24 62.995199382781976L 21 62.995199382781976" cy="44.096639567947385" cx="36" j="1" val="60" barHeight="18.89855981483459" barWidth="3"></path><path id="SvgjsPath1738" d="M 36 62.995199382781976L 36 25.623199768543238Q 36 23.623199768543238 38 23.623199768543238L 37 23.623199768543238Q 39 23.623199768543238 39 25.623199768543238L 39 25.623199768543238L 39 62.995199382781976Q 39 62.995199382781976 39 62.995199382781976L 36 62.995199382781976Q 36 62.995199382781976 36 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 36 62.995199382781976L 36 25.623199768543238Q 36 23.623199768543238 38 23.623199768543238L 37 23.623199768543238Q 39 23.623199768543238 39 25.623199768543238L 39 25.623199768543238L 39 62.995199382781976Q 39 62.995199382781976 39 62.995199382781976L 36 62.995199382781976Q 36 62.995199382781976 36 62.995199382781976z" pathFrom="M 36 62.995199382781976L 36 62.995199382781976L 39 62.995199382781976L 39 62.995199382781976L 39 62.995199382781976L 39 62.995199382781976L 39 62.995199382781976L 36 62.995199382781976" cy="23.623199768543238" cx="51" j="2" val="125" barHeight="39.37199961423874" barWidth="3"></path><path id="SvgjsPath1739" d="M 51 62.995199382781976L 51 52.39615950622558Q 51 50.39615950622558 53 50.39615950622558L 52 50.39615950622558Q 54 50.39615950622558 54 52.39615950622558L 54 52.39615950622558L 54 62.995199382781976Q 54 62.995199382781976 54 62.995199382781976L 51 62.995199382781976Q 51 62.995199382781976 51 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 51 62.995199382781976L 51 52.39615950622558Q 51 50.39615950622558 53 50.39615950622558L 52 50.39615950622558Q 54 50.39615950622558 54 52.39615950622558L 54 52.39615950622558L 54 62.995199382781976Q 54 62.995199382781976 54 62.995199382781976L 51 62.995199382781976Q 51 62.995199382781976 51 62.995199382781976z" pathFrom="M 51 62.995199382781976L 51 62.995199382781976L 54 62.995199382781976L 54 62.995199382781976L 54 62.995199382781976L 54 62.995199382781976L 54 62.995199382781976L 51 62.995199382781976" cy="50.39615950622558" cx="66" j="3" val="40" barHeight="12.599039876556395" barWidth="3"></path><path id="SvgjsPath1740" d="M 66 62.995199382781976L 66 49.24639953708648Q 66 47.24639953708648 68 47.24639953708648L 67 47.24639953708648Q 69 47.24639953708648 69 49.24639953708648L 69 49.24639953708648L 69 62.995199382781976Q 69 62.995199382781976 69 62.995199382781976L 66 62.995199382781976Q 66 62.995199382781976 66 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 66 62.995199382781976L 66 49.24639953708648Q 66 47.24639953708648 68 47.24639953708648L 67 47.24639953708648Q 69 47.24639953708648 69 49.24639953708648L 69 49.24639953708648L 69 62.995199382781976Q 69 62.995199382781976 69 62.995199382781976L 66 62.995199382781976Q 66 62.995199382781976 66 62.995199382781976z" pathFrom="M 66 62.995199382781976L 66 62.995199382781976L 69 62.995199382781976L 69 62.995199382781976L 69 62.995199382781976L 69 62.995199382781976L 69 62.995199382781976L 66 62.995199382781976" cy="47.24639953708648" cx="81" j="4" val="50" barHeight="15.748799845695494" barWidth="3"></path><path id="SvgjsPath1741" d="M 81 62.995199382781976L 81 55.545919475364684Q 81 53.545919475364684 83 53.545919475364684L 82 53.545919475364684Q 84 53.545919475364684 84 55.545919475364684L 84 55.545919475364684L 84 62.995199382781976Q 84 62.995199382781976 84 62.995199382781976L 81 62.995199382781976Q 81 62.995199382781976 81 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 81 62.995199382781976L 81 55.545919475364684Q 81 53.545919475364684 83 53.545919475364684L 82 53.545919475364684Q 84 53.545919475364684 84 55.545919475364684L 84 55.545919475364684L 84 62.995199382781976Q 84 62.995199382781976 84 62.995199382781976L 81 62.995199382781976Q 81 62.995199382781976 81 62.995199382781976z" pathFrom="M 81 62.995199382781976L 81 62.995199382781976L 84 62.995199382781976L 84 62.995199382781976L 84 62.995199382781976L 84 62.995199382781976L 84 62.995199382781976L 81 62.995199382781976" cy="53.545919475364684" cx="96" j="5" val="30" barHeight="9.449279907417296" barWidth="3"></path><path id="SvgjsPath1742" d="M 96 62.995199382781976L 96 42.94687959880828Q 96 40.94687959880828 98 40.94687959880828L 97 40.94687959880828Q 99 40.94687959880828 99 42.94687959880828L 99 42.94687959880828L 99 62.995199382781976Q 99 62.995199382781976 99 62.995199382781976L 96 62.995199382781976Q 96 62.995199382781976 96 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 96 62.995199382781976L 96 42.94687959880828Q 96 40.94687959880828 98 40.94687959880828L 97 40.94687959880828Q 99 40.94687959880828 99 42.94687959880828L 99 42.94687959880828L 99 62.995199382781976Q 99 62.995199382781976 99 62.995199382781976L 96 62.995199382781976Q 96 62.995199382781976 96 62.995199382781976z" pathFrom="M 96 62.995199382781976L 96 62.995199382781976L 99 62.995199382781976L 99 62.995199382781976L 99 62.995199382781976L 99 62.995199382781976L 99 62.995199382781976L 96 62.995199382781976" cy="40.94687959880828" cx="111" j="6" val="70" barHeight="22.048319783973692" barWidth="3"></path><path id="SvgjsPath1743" d="M 111 62.995199382781976L 111 39.79711962966918Q 111 37.79711962966918 113 37.79711962966918L 112 37.79711962966918Q 114 37.79711962966918 114 39.79711962966918L 114 39.79711962966918L 114 62.995199382781976Q 114 62.995199382781976 114 62.995199382781976L 111 62.995199382781976Q 111 62.995199382781976 111 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 111 62.995199382781976L 111 39.79711962966918Q 111 37.79711962966918 113 37.79711962966918L 112 37.79711962966918Q 114 37.79711962966918 114 39.79711962966918L 114 39.79711962966918L 114 62.995199382781976Q 114 62.995199382781976 114 62.995199382781976L 111 62.995199382781976Q 111 62.995199382781976 111 62.995199382781976z" pathFrom="M 111 62.995199382781976L 111 62.995199382781976L 114 62.995199382781976L 114 62.995199382781976L 114 62.995199382781976L 114 62.995199382781976L 114 62.995199382781976L 111 62.995199382781976" cy="37.79711962966918" cx="126" j="7" val="80" barHeight="25.19807975311279" barWidth="3"></path><path id="SvgjsPath1744" d="M 126 62.995199382781976L 126 33.49759969139099Q 126 31.497599691390988 128 31.497599691390988L 127 31.497599691390988Q 129 31.497599691390988 129 33.49759969139099L 129 33.49759969139099L 129 62.995199382781976Q 129 62.995199382781976 129 62.995199382781976L 126 62.995199382781976Q 126 62.995199382781976 126 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 126 62.995199382781976L 126 33.49759969139099Q 126 31.497599691390988 128 31.497599691390988L 127 31.497599691390988Q 129 31.497599691390988 129 33.49759969139099L 129 33.49759969139099L 129 62.995199382781976Q 129 62.995199382781976 129 62.995199382781976L 126 62.995199382781976Q 126 62.995199382781976 126 62.995199382781976z" pathFrom="M 126 62.995199382781976L 126 62.995199382781976L 129 62.995199382781976L 129 62.995199382781976L 129 62.995199382781976L 129 62.995199382781976L 129 62.995199382781976L 126 62.995199382781976" cy="31.497599691390988" cx="141" j="8" val="100" barHeight="31.497599691390988" barWidth="3"></path><path id="SvgjsPath1745" d="M 141 62.995199382781976L 141 52.39615950622558Q 141 50.39615950622558 143 50.39615950622558L 142 50.39615950622558Q 144 50.39615950622558 144 52.39615950622558L 144 52.39615950622558L 144 62.995199382781976Q 144 62.995199382781976 144 62.995199382781976L 141 62.995199382781976Q 141 62.995199382781976 141 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 141 62.995199382781976L 141 52.39615950622558Q 141 50.39615950622558 143 50.39615950622558L 142 50.39615950622558Q 144 50.39615950622558 144 52.39615950622558L 144 52.39615950622558L 144 62.995199382781976Q 144 62.995199382781976 144 62.995199382781976L 141 62.995199382781976Q 141 62.995199382781976 141 62.995199382781976z" pathFrom="M 141 62.995199382781976L 141 62.995199382781976L 144 62.995199382781976L 144 62.995199382781976L 144 62.995199382781976L 144 62.995199382781976L 144 62.995199382781976L 141 62.995199382781976" cy="50.39615950622558" cx="156" j="9" val="40" barHeight="12.599039876556395" barWidth="3"></path><path id="SvgjsPath1746" d="M 156 62.995199382781976L 156 39.79711962966918Q 156 37.79711962966918 158 37.79711962966918L 157 37.79711962966918Q 159 37.79711962966918 159 39.79711962966918L 159 39.79711962966918L 159 62.995199382781976Q 159 62.995199382781976 159 62.995199382781976L 156 62.995199382781976Q 156 62.995199382781976 156 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 156 62.995199382781976L 156 39.79711962966918Q 156 37.79711962966918 158 37.79711962966918L 157 37.79711962966918Q 159 37.79711962966918 159 39.79711962966918L 159 39.79711962966918L 159 62.995199382781976Q 159 62.995199382781976 159 62.995199382781976L 156 62.995199382781976Q 156 62.995199382781976 156 62.995199382781976z" pathFrom="M 156 62.995199382781976L 156 62.995199382781976L 159 62.995199382781976L 159 62.995199382781976L 159 62.995199382781976L 159 62.995199382781976L 159 62.995199382781976L 156 62.995199382781976" cy="37.79711962966918" cx="171" j="10" val="80" barHeight="25.19807975311279" barWidth="3"></path><path id="SvgjsPath1747" d="M 171 62.995199382781976L 171 46.096639567947385Q 171 44.096639567947385 173 44.096639567947385L 172 44.096639567947385Q 174 44.096639567947385 174 46.096639567947385L 174 46.096639567947385L 174 62.995199382781976Q 174 62.995199382781976 174 62.995199382781976L 171 62.995199382781976Q 171 62.995199382781976 171 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 171 62.995199382781976L 171 46.096639567947385Q 171 44.096639567947385 173 44.096639567947385L 172 44.096639567947385Q 174 44.096639567947385 174 46.096639567947385L 174 46.096639567947385L 174 62.995199382781976Q 174 62.995199382781976 174 62.995199382781976L 171 62.995199382781976Q 171 62.995199382781976 171 62.995199382781976z" pathFrom="M 171 62.995199382781976L 171 62.995199382781976L 174 62.995199382781976L 174 62.995199382781976L 174 62.995199382781976L 174 62.995199382781976L 174 62.995199382781976L 171 62.995199382781976" cy="44.096639567947385" cx="186" j="11" val="60" barHeight="18.89855981483459" barWidth="3"></path><path id="SvgjsPath1748" d="M 186 62.995199382781976L 186 27.198079753112793Q 186 25.198079753112793 188 25.198079753112793L 187 25.198079753112793Q 189 25.198079753112793 189 27.198079753112793L 189 27.198079753112793L 189 62.995199382781976Q 189 62.995199382781976 189 62.995199382781976L 186 62.995199382781976Q 186 62.995199382781976 186 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 186 62.995199382781976L 186 27.198079753112793Q 186 25.198079753112793 188 25.198079753112793L 187 25.198079753112793Q 189 25.198079753112793 189 27.198079753112793L 189 27.198079753112793L 189 62.995199382781976Q 189 62.995199382781976 189 62.995199382781976L 186 62.995199382781976Q 186 62.995199382781976 186 62.995199382781976z" pathFrom="M 186 62.995199382781976L 186 62.995199382781976L 189 62.995199382781976L 189 62.995199382781976L 189 62.995199382781976L 189 62.995199382781976L 189 62.995199382781976L 186 62.995199382781976" cy="25.198079753112793" cx="201" j="12" val="120" barHeight="37.79711962966918" barWidth="3"></path><path id="SvgjsPath1749" d="M 201 62.995199382781976L 201 41.37199961423873Q 201 39.37199961423873 203 39.37199961423873L 202 39.37199961423873Q 204 39.37199961423873 204 41.37199961423873L 204 41.37199961423873L 204 62.995199382781976Q 204 62.995199382781976 204 62.995199382781976L 201 62.995199382781976Q 201 62.995199382781976 201 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 201 62.995199382781976L 201 41.37199961423873Q 201 39.37199961423873 203 39.37199961423873L 202 39.37199961423873Q 204 39.37199961423873 204 41.37199961423873L 204 41.37199961423873L 204 62.995199382781976Q 204 62.995199382781976 204 62.995199382781976L 201 62.995199382781976Q 201 62.995199382781976 201 62.995199382781976z" pathFrom="M 201 62.995199382781976L 201 62.995199382781976L 204 62.995199382781976L 204 62.995199382781976L 204 62.995199382781976L 204 62.995199382781976L 204 62.995199382781976L 201 62.995199382781976" cy="39.37199961423873" cx="216" j="13" val="75" barHeight="23.62319976854324" barWidth="3"></path><path id="SvgjsPath1750" d="M 216 62.995199382781976L 216 57.12079945993423Q 216 55.12079945993423 218 55.12079945993423L 217 55.12079945993423Q 219 55.12079945993423 219 57.12079945993423L 219 57.12079945993423L 219 62.995199382781976Q 219 62.995199382781976 219 62.995199382781976L 216 62.995199382781976Q 216 62.995199382781976 216 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 216 62.995199382781976L 216 57.12079945993423Q 216 55.12079945993423 218 55.12079945993423L 217 55.12079945993423Q 219 55.12079945993423 219 57.12079945993423L 219 57.12079945993423L 219 62.995199382781976Q 219 62.995199382781976 219 62.995199382781976L 216 62.995199382781976Q 216 62.995199382781976 216 62.995199382781976z" pathFrom="M 216 62.995199382781976L 216 62.995199382781976L 219 62.995199382781976L 219 62.995199382781976L 219 62.995199382781976L 219 62.995199382781976L 219 62.995199382781976L 216 62.995199382781976" cy="55.12079945993423" cx="231" j="14" val="25" barHeight="7.874399922847747" barWidth="3"></path><path id="SvgjsPath1751" d="M 231 62.995199382781976L 231 22.47343979940414Q 231 20.47343979940414 233 20.47343979940414L 232 20.47343979940414Q 234 20.47343979940414 234 22.47343979940414L 234 22.47343979940414L 234 62.995199382781976Q 234 62.995199382781976 234 62.995199382781976L 231 62.995199382781976Q 231 62.995199382781976 231 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 231 62.995199382781976L 231 22.47343979940414Q 231 20.47343979940414 233 20.47343979940414L 232 20.47343979940414Q 234 20.47343979940414 234 22.47343979940414L 234 22.47343979940414L 234 62.995199382781976Q 234 62.995199382781976 234 62.995199382781976L 231 62.995199382781976Q 231 62.995199382781976 231 62.995199382781976z" pathFrom="M 231 62.995199382781976L 231 62.995199382781976L 234 62.995199382781976L 234 62.995199382781976L 234 62.995199382781976L 234 62.995199382781976L 234 62.995199382781976L 231 62.995199382781976" cy="20.47343979940414" cx="246" j="15" val="135" barHeight="42.521759583377836" barWidth="3"></path><path id="SvgjsPath1752" d="M 246 62.995199382781976L 246 44.52175958337783Q 246 42.52175958337783 248 42.52175958337783L 247 42.52175958337783Q 249 42.52175958337783 249 44.52175958337783L 249 44.52175958337783L 249 62.995199382781976Q 249 62.995199382781976 249 62.995199382781976L 246 62.995199382781976Q 246 62.995199382781976 246 62.995199382781976z" fill="rgba(0,207,221,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 246 62.995199382781976L 246 44.52175958337783Q 246 42.52175958337783 248 42.52175958337783L 247 42.52175958337783Q 249 42.52175958337783 249 44.52175958337783L 249 44.52175958337783L 249 62.995199382781976Q 249 62.995199382781976 249 62.995199382781976L 246 62.995199382781976Q 246 62.995199382781976 246 62.995199382781976z" pathFrom="M 246 62.995199382781976L 246 62.995199382781976L 249 62.995199382781976L 249 62.995199382781976L 249 62.995199382781976L 249 62.995199382781976L 249 62.995199382781976L 246 62.995199382781976" cy="42.52175958337783" cx="261" j="16" val="65" barHeight="20.473439799404144" barWidth="3"></path></g><g id="SvgjsG1753" class="apexcharts-series" seriesName="2021" rel="2" data:realIndex="1"><path id="SvgjsPath1755" d="M 6 37.79711962966918L 6 24.04831978397369Q 6 22.04831978397369 8 22.04831978397369L 7 22.04831978397369Q 9 22.04831978397369 9 24.04831978397369L 9 24.04831978397369L 9 37.79711962966918Q 9 37.79711962966918 9 37.79711962966918L 6 37.79711962966918Q 6 37.79711962966918 6 37.79711962966918z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 6 37.79711962966918L 6 24.04831978397369Q 6 22.04831978397369 8 22.04831978397369L 7 22.04831978397369Q 9 22.04831978397369 9 24.04831978397369L 9 24.04831978397369L 9 37.79711962966918Q 9 37.79711962966918 9 37.79711962966918L 6 37.79711962966918Q 6 37.79711962966918 6 37.79711962966918z" pathFrom="M 6 37.79711962966918L 6 37.79711962966918L 9 37.79711962966918L 9 37.79711962966918L 9 37.79711962966918L 9 37.79711962966918L 9 37.79711962966918L 6 37.79711962966918" cy="22.04831978397369" cx="21" j="0" val="50" barHeight="15.748799845695494" barWidth="3"></path><path id="SvgjsPath1756" d="M 21 44.096639567947385L 21 25.62319976854324Q 21 23.62319976854324 23 23.62319976854324L 22 23.62319976854324Q 24 23.62319976854324 24 25.62319976854324L 24 25.62319976854324L 24 44.096639567947385Q 24 44.096639567947385 24 44.096639567947385L 21 44.096639567947385Q 21 44.096639567947385 21 44.096639567947385z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 21 44.096639567947385L 21 25.62319976854324Q 21 23.62319976854324 23 23.62319976854324L 22 23.62319976854324Q 24 23.62319976854324 24 25.62319976854324L 24 25.62319976854324L 24 44.096639567947385Q 24 44.096639567947385 24 44.096639567947385L 21 44.096639567947385Q 21 44.096639567947385 21 44.096639567947385z" pathFrom="M 21 44.096639567947385L 21 44.096639567947385L 24 44.096639567947385L 24 44.096639567947385L 24 44.096639567947385L 24 44.096639567947385L 24 44.096639567947385L 21 44.096639567947385" cy="23.62319976854324" cx="36" j="1" val="65" barHeight="20.473439799404144" barWidth="3"></path><path id="SvgjsPath1757" d="M 36 23.623199768543238L 36 13.024159891986843Q 36 11.024159891986843 38 11.024159891986843L 37 11.024159891986843Q 39 11.024159891986843 39 13.024159891986843L 39 13.024159891986843L 39 23.623199768543238Q 39 23.623199768543238 39 23.623199768543238L 36 23.623199768543238Q 36 23.623199768543238 36 23.623199768543238z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 36 23.623199768543238L 36 13.024159891986843Q 36 11.024159891986843 38 11.024159891986843L 37 11.024159891986843Q 39 11.024159891986843 39 13.024159891986843L 39 13.024159891986843L 39 23.623199768543238Q 39 23.623199768543238 39 23.623199768543238L 36 23.623199768543238Q 36 23.623199768543238 36 23.623199768543238z" pathFrom="M 36 23.623199768543238L 36 23.623199768543238L 39 23.623199768543238L 39 23.623199768543238L 39 23.623199768543238L 39 23.623199768543238L 39 23.623199768543238L 36 23.623199768543238" cy="11.024159891986843" cx="51" j="2" val="40" barHeight="12.599039876556395" barWidth="3"></path><path id="SvgjsPath1758" d="M 51 50.39615950622558L 51 20.89855981483459Q 51 18.89855981483459 53 18.89855981483459L 52 18.89855981483459Q 54 18.89855981483459 54 20.89855981483459L 54 20.89855981483459L 54 50.39615950622558Q 54 50.39615950622558 54 50.39615950622558L 51 50.39615950622558Q 51 50.39615950622558 51 50.39615950622558z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 51 50.39615950622558L 51 20.89855981483459Q 51 18.89855981483459 53 18.89855981483459L 52 18.89855981483459Q 54 18.89855981483459 54 20.89855981483459L 54 20.89855981483459L 54 50.39615950622558Q 54 50.39615950622558 54 50.39615950622558L 51 50.39615950622558Q 51 50.39615950622558 51 50.39615950622558z" pathFrom="M 51 50.39615950622558L 51 50.39615950622558L 54 50.39615950622558L 54 50.39615950622558L 54 50.39615950622558L 54 50.39615950622558L 54 50.39615950622558L 51 50.39615950622558" cy="18.89855981483459" cx="66" j="3" val="100" barHeight="31.497599691390988" barWidth="3"></path><path id="SvgjsPath1759" d="M 66 47.24639953708648L 66 39.79711962966918Q 66 37.79711962966918 68 37.79711962966918L 67 37.79711962966918Q 69 37.79711962966918 69 39.79711962966918L 69 39.79711962966918L 69 47.24639953708648Q 69 47.24639953708648 69 47.24639953708648L 66 47.24639953708648Q 66 47.24639953708648 66 47.24639953708648z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 66 47.24639953708648L 66 39.79711962966918Q 66 37.79711962966918 68 37.79711962966918L 67 37.79711962966918Q 69 37.79711962966918 69 39.79711962966918L 69 39.79711962966918L 69 47.24639953708648Q 69 47.24639953708648 69 47.24639953708648L 66 47.24639953708648Q 66 47.24639953708648 66 47.24639953708648z" pathFrom="M 66 47.24639953708648L 66 47.24639953708648L 69 47.24639953708648L 69 47.24639953708648L 69 47.24639953708648L 69 47.24639953708648L 69 47.24639953708648L 66 47.24639953708648" cy="37.79711962966918" cx="81" j="4" val="30" barHeight="9.449279907417296" barWidth="3"></path><path id="SvgjsPath1760" d="M 81 53.545919475364684L 81 46.09663956794739Q 81 44.09663956794739 83 44.09663956794739L 82 44.09663956794739Q 84 44.09663956794739 84 46.09663956794739L 84 46.09663956794739L 84 53.545919475364684Q 84 53.545919475364684 84 53.545919475364684L 81 53.545919475364684Q 81 53.545919475364684 81 53.545919475364684z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 81 53.545919475364684L 81 46.09663956794739Q 81 44.09663956794739 83 44.09663956794739L 82 44.09663956794739Q 84 44.09663956794739 84 46.09663956794739L 84 46.09663956794739L 84 53.545919475364684Q 84 53.545919475364684 84 53.545919475364684L 81 53.545919475364684Q 81 53.545919475364684 81 53.545919475364684z" pathFrom="M 81 53.545919475364684L 81 53.545919475364684L 84 53.545919475364684L 84 53.545919475364684L 84 53.545919475364684L 84 53.545919475364684L 84 53.545919475364684L 81 53.545919475364684" cy="44.09663956794739" cx="96" j="5" val="30" barHeight="9.449279907417296" barWidth="3"></path><path id="SvgjsPath1761" d="M 96 40.94687959880828L 96 17.74879984569549Q 96 15.74879984569549 98 15.74879984569549L 97 15.74879984569549Q 99 15.74879984569549 99 17.74879984569549L 99 17.74879984569549L 99 40.94687959880828Q 99 40.94687959880828 99 40.94687959880828L 96 40.94687959880828Q 96 40.94687959880828 96 40.94687959880828z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 96 40.94687959880828L 96 17.74879984569549Q 96 15.74879984569549 98 15.74879984569549L 97 15.74879984569549Q 99 15.74879984569549 99 17.74879984569549L 99 17.74879984569549L 99 40.94687959880828Q 99 40.94687959880828 99 40.94687959880828L 96 40.94687959880828Q 96 40.94687959880828 96 40.94687959880828z" pathFrom="M 96 40.94687959880828L 96 40.94687959880828L 99 40.94687959880828L 99 40.94687959880828L 99 40.94687959880828L 99 40.94687959880828L 99 40.94687959880828L 96 40.94687959880828" cy="15.74879984569549" cx="111" j="6" val="80" barHeight="25.19807975311279" barWidth="3"></path><path id="SvgjsPath1762" d="M 111 37.79711962966918L 111 33.49759969139099Q 111 31.497599691390988 113 31.497599691390988L 112 31.497599691390988Q 114 31.497599691390988 114 33.49759969139099L 114 33.49759969139099L 114 37.79711962966918Q 114 37.79711962966918 114 37.79711962966918L 111 37.79711962966918Q 111 37.79711962966918 111 37.79711962966918z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 111 37.79711962966918L 111 33.49759969139099Q 111 31.497599691390988 113 31.497599691390988L 112 31.497599691390988Q 114 31.497599691390988 114 33.49759969139099L 114 33.49759969139099L 114 37.79711962966918Q 114 37.79711962966918 114 37.79711962966918L 111 37.79711962966918Q 111 37.79711962966918 111 37.79711962966918z" pathFrom="M 111 37.79711962966918L 111 37.79711962966918L 114 37.79711962966918L 114 37.79711962966918L 114 37.79711962966918L 114 37.79711962966918L 114 37.79711962966918L 111 37.79711962966918" cy="31.497599691390988" cx="126" j="7" val="20" barHeight="6.2995199382781975" barWidth="3"></path><path id="SvgjsPath1763" d="M 126 31.497599691390988L 126 17.748799845695494Q 126 15.748799845695494 128 15.748799845695494L 127 15.748799845695494Q 129 15.748799845695494 129 17.748799845695494L 129 17.748799845695494L 129 31.497599691390988Q 129 31.497599691390988 129 31.497599691390988L 126 31.497599691390988Q 126 31.497599691390988 126 31.497599691390988z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 126 31.497599691390988L 126 17.748799845695494Q 126 15.748799845695494 128 15.748799845695494L 127 15.748799845695494Q 129 15.748799845695494 129 17.748799845695494L 129 17.748799845695494L 129 31.497599691390988Q 129 31.497599691390988 129 31.497599691390988L 126 31.497599691390988Q 126 31.497599691390988 126 31.497599691390988z" pathFrom="M 126 31.497599691390988L 126 31.497599691390988L 129 31.497599691390988L 129 31.497599691390988L 129 31.497599691390988L 129 31.497599691390988L 129 31.497599691390988L 126 31.497599691390988" cy="15.748799845695494" cx="141" j="8" val="50" barHeight="15.748799845695494" barWidth="3"></path><path id="SvgjsPath1764" d="M 141 50.39615950622558L 141 38.222239645099634Q 141 36.222239645099634 143 36.222239645099634L 142 36.222239645099634Q 144 36.222239645099634 144 38.222239645099634L 144 38.222239645099634L 144 50.39615950622558Q 144 50.39615950622558 144 50.39615950622558L 141 50.39615950622558Q 141 50.39615950622558 141 50.39615950622558z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 141 50.39615950622558L 141 38.222239645099634Q 141 36.222239645099634 143 36.222239645099634L 142 36.222239645099634Q 144 36.222239645099634 144 38.222239645099634L 144 38.222239645099634L 144 50.39615950622558Q 144 50.39615950622558 144 50.39615950622558L 141 50.39615950622558Q 141 50.39615950622558 141 50.39615950622558z" pathFrom="M 141 50.39615950622558L 141 50.39615950622558L 144 50.39615950622558L 144 50.39615950622558L 144 50.39615950622558L 144 50.39615950622558L 144 50.39615950622558L 141 50.39615950622558" cy="36.222239645099634" cx="156" j="9" val="45" barHeight="14.173919861125945" barWidth="3"></path><path id="SvgjsPath1765" d="M 156 37.79711962966918L 156 30.347839722251887Q 156 28.347839722251887 158 28.347839722251887L 157 28.347839722251887Q 159 28.347839722251887 159 30.347839722251887L 159 30.347839722251887L 159 37.79711962966918Q 159 37.79711962966918 159 37.79711962966918L 156 37.79711962966918Q 156 37.79711962966918 156 37.79711962966918z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 156 37.79711962966918L 156 30.347839722251887Q 156 28.347839722251887 158 28.347839722251887L 157 28.347839722251887Q 159 28.347839722251887 159 30.347839722251887L 159 30.347839722251887L 159 37.79711962966918Q 159 37.79711962966918 159 37.79711962966918L 156 37.79711962966918Q 156 37.79711962966918 156 37.79711962966918z" pathFrom="M 156 37.79711962966918L 156 37.79711962966918L 159 37.79711962966918L 159 37.79711962966918L 159 37.79711962966918L 159 37.79711962966918L 159 37.79711962966918L 156 37.79711962966918" cy="28.347839722251887" cx="171" j="10" val="30" barHeight="9.449279907417296" barWidth="3"></path><path id="SvgjsPath1766" d="M 171 44.096639567947385L 171 17.748799845695494Q 171 15.748799845695494 173 15.748799845695494L 172 15.748799845695494Q 174 15.748799845695494 174 17.748799845695494L 174 17.748799845695494L 174 44.096639567947385Q 174 44.096639567947385 174 44.096639567947385L 171 44.096639567947385Q 171 44.096639567947385 171 44.096639567947385z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 171 44.096639567947385L 171 17.748799845695494Q 171 15.748799845695494 173 15.748799845695494L 172 15.748799845695494Q 174 15.748799845695494 174 17.748799845695494L 174 17.748799845695494L 174 44.096639567947385Q 174 44.096639567947385 174 44.096639567947385L 171 44.096639567947385Q 171 44.096639567947385 171 44.096639567947385z" pathFrom="M 171 44.096639567947385L 171 44.096639567947385L 174 44.096639567947385L 174 44.096639567947385L 174 44.096639567947385L 174 44.096639567947385L 174 44.096639567947385L 171 44.096639567947385" cy="15.748799845695494" cx="186" j="11" val="90" barHeight="28.34783972225189" barWidth="3"></path><path id="SvgjsPath1767" d="M 186 25.198079753112793L 186 5.149759969139101Q 186 3.149759969139101 188 3.149759969139101L 187 3.149759969139101Q 189 3.149759969139101 189 5.149759969139101L 189 5.149759969139101L 189 25.198079753112793Q 189 25.198079753112793 189 25.198079753112793L 186 25.198079753112793Q 186 25.198079753112793 186 25.198079753112793z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 186 25.198079753112793L 186 5.149759969139101Q 186 3.149759969139101 188 3.149759969139101L 187 3.149759969139101Q 189 3.149759969139101 189 5.149759969139101L 189 5.149759969139101L 189 25.198079753112793Q 189 25.198079753112793 189 25.198079753112793L 186 25.198079753112793Q 186 25.198079753112793 186 25.198079753112793z" pathFrom="M 186 25.198079753112793L 186 25.198079753112793L 189 25.198079753112793L 189 25.198079753112793L 189 25.198079753112793L 189 25.198079753112793L 189 25.198079753112793L 186 25.198079753112793" cy="3.149759969139101" cx="201" j="12" val="70" barHeight="22.048319783973692" barWidth="3"></path><path id="SvgjsPath1768" d="M 201 39.37199961423873L 201 28.772959737682335Q 201 26.772959737682335 203 26.772959737682335L 202 26.772959737682335Q 204 26.772959737682335 204 28.772959737682335L 204 28.772959737682335L 204 39.37199961423873Q 204 39.37199961423873 204 39.37199961423873L 201 39.37199961423873Q 201 39.37199961423873 201 39.37199961423873z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 201 39.37199961423873L 201 28.772959737682335Q 201 26.772959737682335 203 26.772959737682335L 202 26.772959737682335Q 204 26.772959737682335 204 28.772959737682335L 204 28.772959737682335L 204 39.37199961423873Q 204 39.37199961423873 204 39.37199961423873L 201 39.37199961423873Q 201 39.37199961423873 201 39.37199961423873z" pathFrom="M 201 39.37199961423873L 201 39.37199961423873L 204 39.37199961423873L 204 39.37199961423873L 204 39.37199961423873L 204 39.37199961423873L 204 39.37199961423873L 201 39.37199961423873" cy="26.772959737682335" cx="216" j="13" val="40" barHeight="12.599039876556395" barWidth="3"></path><path id="SvgjsPath1769" d="M 216 55.12079945993423L 216 41.37199961423874Q 216 39.37199961423874 218 39.37199961423874L 217 39.37199961423874Q 219 39.37199961423874 219 41.37199961423874L 219 41.37199961423874L 219 55.12079945993423Q 219 55.12079945993423 219 55.12079945993423L 216 55.12079945993423Q 216 55.12079945993423 216 55.12079945993423z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 216 55.12079945993423L 216 41.37199961423874Q 216 39.37199961423874 218 39.37199961423874L 217 39.37199961423874Q 219 39.37199961423874 219 41.37199961423874L 219 41.37199961423874L 219 55.12079945993423Q 219 55.12079945993423 219 55.12079945993423L 216 55.12079945993423Q 216 55.12079945993423 216 55.12079945993423z" pathFrom="M 216 55.12079945993423L 216 55.12079945993423L 219 55.12079945993423L 219 55.12079945993423L 219 55.12079945993423L 219 55.12079945993423L 219 55.12079945993423L 216 55.12079945993423" cy="39.37199961423874" cx="231" j="14" val="50" barHeight="15.748799845695494" barWidth="3"></path><path id="SvgjsPath1770" d="M 231 20.47343979940414L 231 9.874399922847745Q 231 7.874399922847745 233 7.874399922847745L 232 7.874399922847745Q 234 7.874399922847745 234 9.874399922847745L 234 9.874399922847745L 234 20.47343979940414Q 234 20.47343979940414 234 20.47343979940414L 231 20.47343979940414Q 231 20.47343979940414 231 20.47343979940414z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 231 20.47343979940414L 231 9.874399922847745Q 231 7.874399922847745 233 7.874399922847745L 232 7.874399922847745Q 234 7.874399922847745 234 9.874399922847745L 234 9.874399922847745L 234 20.47343979940414Q 234 20.47343979940414 234 20.47343979940414L 231 20.47343979940414Q 231 20.47343979940414 231 20.47343979940414z" pathFrom="M 231 20.47343979940414L 231 20.47343979940414L 234 20.47343979940414L 234 20.47343979940414L 234 20.47343979940414L 234 20.47343979940414L 234 20.47343979940414L 231 20.47343979940414" cy="7.874399922847745" cx="246" j="15" val="40" barHeight="12.599039876556395" barWidth="3"></path><path id="SvgjsPath1771" d="M 246 42.52175958337783L 246 25.623199768543238Q 246 23.623199768543238 248 23.623199768543238L 247 23.623199768543238Q 249 23.623199768543238 249 25.623199768543238L 249 25.623199768543238L 249 42.52175958337783Q 249 42.52175958337783 249 42.52175958337783L 246 42.52175958337783Q 246 42.52175958337783 246 42.52175958337783z" fill="#69809a29" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskbng5yuq1)" pathTo="M 246 42.52175958337783L 246 25.623199768543238Q 246 23.623199768543238 248 23.623199768543238L 247 23.623199768543238Q 249 23.623199768543238 249 25.623199768543238L 249 25.623199768543238L 249 42.52175958337783Q 249 42.52175958337783 249 42.52175958337783L 246 42.52175958337783Q 246 42.52175958337783 246 42.52175958337783z" pathFrom="M 246 42.52175958337783L 246 42.52175958337783L 249 42.52175958337783L 249 42.52175958337783L 249 42.52175958337783L 249 42.52175958337783L 249 42.52175958337783L 246 42.52175958337783" cy="23.623199768543238" cx="261" j="16" val="60" barHeight="18.89855981483459" barWidth="3"></path></g><g id="SvgjsG1735" class="apexcharts-datalabels" data:realIndex="0"></g><g id="SvgjsG1754" class="apexcharts-datalabels" data:realIndex="1"></g></g><line id="SvgjsLine1836" x1="0" y1="0" x2="255" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1837" x1="0" y1="0" x2="255" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1838" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1839" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1840" class="apexcharts-point-annotations"></g></g><g id="SvgjsG1825" class="apexcharts-yaxis" rel="0" transform="translate(-18, 0)"></g><g id="SvgjsG1724" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend" style="max-height: 45px;"></div><div class="apexcharts-tooltip apexcharts-theme-light" style="left: 104.362px; top: 38.7577px;"><div class="apexcharts-tooltip-series-group apexcharts-active" style="order: 1; display: flex;"><span class="apexcharts-tooltip-marker" style="background-color: rgba(0, 207, 221, 0.85);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">2020: </span><span class="apexcharts-tooltip-text-y-value">75</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2; display: none;"><span class="apexcharts-tooltip-marker" style="background-color: rgba(0, 207, 221, 0.85);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">2020: </span><span class="apexcharts-tooltip-text-y-value">75</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div></div></div>
                              <div class="resize-triggers"><div class="expand-trigger"><div style="width: 300px; height: 106px;"></div></div><div class="contract-trigger"></div></div></div>
                            </div>
                          </div>
                          <!--/ Revenue Growth Chart -->
                        </div>
                      </div>
                      <!--/ Statistics cards & Revenue Growth Chart -->


                    
                      <!-- Weekly Order Summary -->
                      <div class="col-xl-8 col-12 mb-4">
                        <div class="card">
                          <div class="row row-bordered m-0">
                            <!-- Order Summary -->
                            <div class="col-md-8 col-12 px-0">
                              <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="card-title mb-0">Weekly Order Summary</h5>
                                <div class="dropdown">
                                  <button class="btn p-0" type="button" id="orderSummaryOptions" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="bx bx-dots-vertical-rounded"></i>
                                  </button>
                                  <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orderSummaryOptions">
                                    <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                    <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                    <a class="dropdown-item" href="javascript:void(0);">Share</a>
                                  </div>
                                </div>
                              </div>
                              <div class="card-body p-0" style="position: relative;">
                                <div id="orderSummaryChart" style="min-height: 245px;"><div id="apexcharts6voia10of" class="apexcharts-canvas apexcharts6voia10of apexcharts-theme-light" style="width: 634px; height: 230px;"><svg id="SvgjsSvg1841" width="634" height="230" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg apexcharts-zoomable" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1843" class="apexcharts-inner apexcharts-graphical" transform="translate(51.70000076293945, 15)"><defs id="SvgjsDefs1842"><clipPath id="gridRectMask6voia10of"><rect id="SvgjsRect1849" width="568.9940910339355" height="190.70079907417298" x="-4" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMask6voia10of"></clipPath><clipPath id="nonForecastMask6voia10of"></clipPath><clipPath id="gridRectMarkerMask6voia10of"><rect id="SvgjsRect1850" width="588.9940910339355" height="214.70079907417298" x="-14" y="-14" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><linearGradient id="SvgjsLinearGradient1874" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop1875" stop-opacity="0.7" stop-color="rgba(90,141,238,0.7)" offset="0"></stop><stop id="SvgjsStop1876" stop-opacity="0.25" stop-color="rgba(222,232,252,0.25)" offset="0.95"></stop><stop id="SvgjsStop1877" stop-opacity="0.25" stop-color="rgba(222,232,252,0.25)" offset="1"></stop></linearGradient><filter id="SvgjsFilter1879" filterUnits="userSpaceOnUse" width="200%" height="200%" x="-50%" y="-50%"><feFlood id="SvgjsFeFlood1880" flood-color="#5a8dee" flood-opacity="0.15" result="SvgjsFeFlood1880Out" in="SourceGraphic"></feFlood><feComposite id="SvgjsFeComposite1881" in="SvgjsFeFlood1880Out" in2="SourceAlpha" operator="in" result="SvgjsFeComposite1881Out"></feComposite><feOffset id="SvgjsFeOffset1882" dx="2" dy="18" result="SvgjsFeOffset1882Out" in="SvgjsFeComposite1881Out"></feOffset><feGaussianBlur id="SvgjsFeGaussianBlur1883" stdDeviation="3 " result="SvgjsFeGaussianBlur1883Out" in="SvgjsFeOffset1882Out"></feGaussianBlur><feMerge id="SvgjsFeMerge1884" result="SvgjsFeMerge1884Out" in="SourceGraphic"><feMergeNode id="SvgjsFeMergeNode1885" in="SvgjsFeGaussianBlur1883Out"></feMergeNode><feMergeNode id="SvgjsFeMergeNode1886" in="[object Arguments]"></feMergeNode></feMerge><feBlend id="SvgjsFeBlend1887" in="SourceGraphic" in2="SvgjsFeMerge1884Out" mode="normal" result="SvgjsFeBlend1887Out"></feBlend></filter><filter id="SvgjsFilter1889" filterUnits="userSpaceOnUse" width="200%" height="200%" x="-50%" y="-50%"><feFlood id="SvgjsFeFlood1890" flood-color="#5a8dee" flood-opacity="0.15" result="SvgjsFeFlood1890Out" in="SourceGraphic"></feFlood><feComposite id="SvgjsFeComposite1891" in="SvgjsFeFlood1890Out" in2="SourceAlpha" operator="in" result="SvgjsFeComposite1891Out"></feComposite><feOffset id="SvgjsFeOffset1892" dx="2" dy="18" result="SvgjsFeOffset1892Out" in="SvgjsFeComposite1891Out"></feOffset><feGaussianBlur id="SvgjsFeGaussianBlur1893" stdDeviation="3 " result="SvgjsFeGaussianBlur1893Out" in="SvgjsFeOffset1892Out"></feGaussianBlur><feMerge id="SvgjsFeMerge1894" result="SvgjsFeMerge1894Out" in="SourceGraphic"><feMergeNode id="SvgjsFeMergeNode1895" in="SvgjsFeGaussianBlur1893Out"></feMergeNode><feMergeNode id="SvgjsFeMergeNode1896" in="[object Arguments]"></feMergeNode></feMerge><feBlend id="SvgjsFeBlend1897" in="SourceGraphic" in2="SvgjsFeMerge1894Out" mode="normal" result="SvgjsFeBlend1897Out"></feBlend></filter></defs><line id="SvgjsLine1848" x1="61.83267678154839" y1="0" x2="61.83267678154839" y2="186.70079907417298" stroke="#b6b6b6" stroke-dasharray="3" stroke-linecap="butt" class="apexcharts-xcrosshairs" x="61.83267678154839" y="0" width="1" height="186.70079907417298" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line><g id="SvgjsG1898" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1899" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"><text id="SvgjsText1901" font-family="Helvetica, Arial, sans-serif" x="0" y="215.70079907417298" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1902">Jan</tspan><title>Jan</title></text><text id="SvgjsText1904" font-family="Helvetica, Arial, sans-serif" x="62.332676781548386" y="215.70079907417298" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1905">Feb</tspan><title>Feb</title></text><text id="SvgjsText1907" font-family="Helvetica, Arial, sans-serif" x="124.66535356309677" y="215.70079907417298" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1908">Mar</tspan><title>Mar</title></text><text id="SvgjsText1910" font-family="Helvetica, Arial, sans-serif" x="186.99803034464517" y="215.70079907417298" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1911">Apr</tspan><title>Apr</title></text><text id="SvgjsText1913" font-family="Helvetica, Arial, sans-serif" x="249.33070712619357" y="215.70079907417298" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1914">May</tspan><title>May</title></text><text id="SvgjsText1916" font-family="Helvetica, Arial, sans-serif" x="311.663383907742" y="215.70079907417298" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1917">Jun</tspan><title>Jun</title></text><text id="SvgjsText1919" font-family="Helvetica, Arial, sans-serif" x="373.9960606892904" y="215.70079907417298" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1920">Jul</tspan><title>Jul</title></text><text id="SvgjsText1922" font-family="Helvetica, Arial, sans-serif" x="436.3287374708388" y="215.70079907417298" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1923">Aug</tspan><title>Aug</title></text><text id="SvgjsText1925" font-family="Helvetica, Arial, sans-serif" x="498.6614142523872" y="215.70079907417298" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1926">Sep</tspan><title>Sep</title></text><text id="SvgjsText1928" font-family="Helvetica, Arial, sans-serif" x="560.9940910339355" y="215.70079907417298" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1929">Oct</tspan><title>Oct</title></text></g></g><g id="SvgjsG1942" class="apexcharts-grid"><g id="SvgjsG1943" class="apexcharts-gridlines-horizontal"><line id="SvgjsLine1945" x1="0" y1="0" x2="560.9940910339355" y2="0" stroke="#e9ecee" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1946" x1="0" y1="46.675199768543244" x2="560.9940910339355" y2="46.675199768543244" stroke="#e9ecee" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1947" x1="0" y1="93.35039953708649" x2="560.9940910339355" y2="93.35039953708649" stroke="#e9ecee" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1948" x1="0" y1="140.02559930562973" x2="560.9940910339355" y2="140.02559930562973" stroke="#e9ecee" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1949" x1="0" y1="186.70079907417298" x2="560.9940910339355" y2="186.70079907417298" stroke="#e9ecee" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line></g><g id="SvgjsG1944" class="apexcharts-gridlines-vertical"></g><line id="SvgjsLine1951" x1="0" y1="186.70079907417298" x2="560.9940910339355" y2="186.70079907417298" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line><line id="SvgjsLine1950" x1="0" y1="1" x2="0" y2="186.70079907417298" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line></g><g id="SvgjsG1851" class="apexcharts-area-series apexcharts-plot-series"><g id="SvgjsG1852" class="apexcharts-series" seriesName="seriesx1" data:longestSeries="true" rel="1" data:realIndex="0"><path id="SvgjsPath1878" d="M 0 186.70079907417298L 0 116.68799942135811C 21.816436873541935 116.68799942135811 40.516239908006455 102.68543949079513 62.33267678154839 102.68543949079513C 84.14911365509033 102.68543949079513 102.84891668955485 126.02303937506676 124.66535356309679 126.02303937506676C 146.48179043663873 126.02303937506676 165.18159347110324 98.01791951394081 186.99803034464517 98.01791951394081C 208.8144672181871 98.01791951394081 227.51427025265164 112.02047944450379 249.33070712619357 112.02047944450379C 271.1471439997355 112.02047944450379 289.8469470342 42.00767979168893 311.66338390774195 42.00767979168893C 333.4798207812839 42.00767979168893 352.1796238157484 102.68543949079513 373.99606068929035 102.68543949079513C 395.8124975628323 102.68543949079513 414.5123005972968 65.34527967596054 436.32873747083875 65.34527967596054C 458.1451743443807 65.34527967596054 476.8449773788452 79.34783960652352 498.66141425238715 79.34783960652352C 520.4778511259291 79.34783960652352 539.1776541603936 4.667519976854322 560.9940910339355 4.667519976854322C 560.9940910339355 4.667519976854322 560.9940910339355 4.667519976854322 560.9940910339355 186.70079907417298M 560.9940910339355 4.667519976854322z" fill="url(#SvgjsLinearGradient1874)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMask6voia10of)" filter="url(#SvgjsFilter1879)" pathTo="M 0 186.70079907417298L 0 116.68799942135811C 21.816436873541935 116.68799942135811 40.516239908006455 102.68543949079513 62.33267678154839 102.68543949079513C 84.14911365509033 102.68543949079513 102.84891668955485 126.02303937506676 124.66535356309679 126.02303937506676C 146.48179043663873 126.02303937506676 165.18159347110324 98.01791951394081 186.99803034464517 98.01791951394081C 208.8144672181871 98.01791951394081 227.51427025265164 112.02047944450379 249.33070712619357 112.02047944450379C 271.1471439997355 112.02047944450379 289.8469470342 42.00767979168893 311.66338390774195 42.00767979168893C 333.4798207812839 42.00767979168893 352.1796238157484 102.68543949079513 373.99606068929035 102.68543949079513C 395.8124975628323 102.68543949079513 414.5123005972968 65.34527967596054 436.32873747083875 65.34527967596054C 458.1451743443807 65.34527967596054 476.8449773788452 79.34783960652352 498.66141425238715 79.34783960652352C 520.4778511259291 79.34783960652352 539.1776541603936 4.667519976854322 560.9940910339355 4.667519976854322C 560.9940910339355 4.667519976854322 560.9940910339355 4.667519976854322 560.9940910339355 186.70079907417298M 560.9940910339355 4.667519976854322z" pathFrom="M -1 186.70079907417298L -1 186.70079907417298L 62.33267678154839 186.70079907417298L 124.66535356309679 186.70079907417298L 186.99803034464517 186.70079907417298L 249.33070712619357 186.70079907417298L 311.66338390774195 186.70079907417298L 373.99606068929035 186.70079907417298L 436.32873747083875 186.70079907417298L 498.66141425238715 186.70079907417298L 560.9940910339355 186.70079907417298"></path><path id="SvgjsPath1888" d="M 0 116.68799942135811C 21.816436873541935 116.68799942135811 40.516239908006455 102.68543949079513 62.33267678154839 102.68543949079513C 84.14911365509033 102.68543949079513 102.84891668955485 126.02303937506676 124.66535356309679 126.02303937506676C 146.48179043663873 126.02303937506676 165.18159347110324 98.01791951394081 186.99803034464517 98.01791951394081C 208.8144672181871 98.01791951394081 227.51427025265164 112.02047944450379 249.33070712619357 112.02047944450379C 271.1471439997355 112.02047944450379 289.8469470342 42.00767979168893 311.66338390774195 42.00767979168893C 333.4798207812839 42.00767979168893 352.1796238157484 102.68543949079513 373.99606068929035 102.68543949079513C 395.8124975628323 102.68543949079513 414.5123005972968 65.34527967596054 436.32873747083875 65.34527967596054C 458.1451743443807 65.34527967596054 476.8449773788452 79.34783960652352 498.66141425238715 79.34783960652352C 520.4778511259291 79.34783960652352 539.1776541603936 4.667519976854322 560.9940910339355 4.667519976854322" fill="none" fill-opacity="1" stroke="#5a8dee" stroke-opacity="1" stroke-linecap="round" stroke-width="4" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMask6voia10of)" filter="url(#SvgjsFilter1889)" pathTo="M 0 116.68799942135811C 21.816436873541935 116.68799942135811 40.516239908006455 102.68543949079513 62.33267678154839 102.68543949079513C 84.14911365509033 102.68543949079513 102.84891668955485 126.02303937506676 124.66535356309679 126.02303937506676C 146.48179043663873 126.02303937506676 165.18159347110324 98.01791951394081 186.99803034464517 98.01791951394081C 208.8144672181871 98.01791951394081 227.51427025265164 112.02047944450379 249.33070712619357 112.02047944450379C 271.1471439997355 112.02047944450379 289.8469470342 42.00767979168893 311.66338390774195 42.00767979168893C 333.4798207812839 42.00767979168893 352.1796238157484 102.68543949079513 373.99606068929035 102.68543949079513C 395.8124975628323 102.68543949079513 414.5123005972968 65.34527967596054 436.32873747083875 65.34527967596054C 458.1451743443807 65.34527967596054 476.8449773788452 79.34783960652352 498.66141425238715 79.34783960652352C 520.4778511259291 79.34783960652352 539.1776541603936 4.667519976854322 560.9940910339355 4.667519976854322" pathFrom="M -1 186.70079907417298L -1 186.70079907417298L 62.33267678154839 186.70079907417298L 124.66535356309679 186.70079907417298L 186.99803034464517 186.70079907417298L 249.33070712619357 186.70079907417298L 311.66338390774195 186.70079907417298L 373.99606068929035 186.70079907417298L 436.32873747083875 186.70079907417298L 498.66141425238715 186.70079907417298L 560.9940910339355 186.70079907417298"></path><g id="SvgjsG1853" class="apexcharts-series-markers-wrap" data:realIndex="0"><g id="SvgjsG1855" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMask6voia10of)"><circle id="SvgjsCircle1856" r="6" cx="0" cy="116.68799942135811" class="apexcharts-marker no-pointer-events wblpsx63d" stroke="transparent" fill="transparent" fill-opacity="1" stroke-width="4" stroke-opacity="0.9" rel="0" j="0" index="0" default-marker-size="6"></circle><circle id="SvgjsCircle1857" r="6" cx="62.33267678154839" cy="102.68543949079513" class="apexcharts-marker no-pointer-events wu590vrqm" stroke="transparent" fill="transparent" fill-opacity="1" stroke-width="4" stroke-opacity="0.9" rel="1" j="1" index="0" default-marker-size="6"></circle></g><g id="SvgjsG1858" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMask6voia10of)"><circle id="SvgjsCircle1859" r="6" cx="124.66535356309679" cy="126.02303937506676" class="apexcharts-marker no-pointer-events wvv9ahywd" stroke="transparent" fill="transparent" fill-opacity="1" stroke-width="4" stroke-opacity="0.9" rel="2" j="2" index="0" default-marker-size="6"></circle></g><g id="SvgjsG1860" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMask6voia10of)"><circle id="SvgjsCircle1861" r="6" cx="186.99803034464517" cy="98.01791951394081" class="apexcharts-marker no-pointer-events wvoeu05x9" stroke="transparent" fill="transparent" fill-opacity="1" stroke-width="4" stroke-opacity="0.9" rel="3" j="3" index="0" default-marker-size="6"></circle></g><g id="SvgjsG1862" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMask6voia10of)"><circle id="SvgjsCircle1863" r="6" cx="249.33070712619357" cy="112.02047944450379" class="apexcharts-marker no-pointer-events wfm41s4jv" stroke="transparent" fill="transparent" fill-opacity="1" stroke-width="4" stroke-opacity="0.9" rel="4" j="4" index="0" default-marker-size="6"></circle></g><g id="SvgjsG1864" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMask6voia10of)"><circle id="SvgjsCircle1865" r="6" cx="311.66338390774195" cy="42.00767979168893" class="apexcharts-marker no-pointer-events w9qr4ro8w" stroke="transparent" fill="transparent" fill-opacity="1" stroke-width="4" stroke-opacity="0.9" rel="5" j="5" index="0" default-marker-size="6"></circle></g><g id="SvgjsG1866" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMask6voia10of)"><circle id="SvgjsCircle1867" r="6" cx="373.99606068929035" cy="102.68543949079513" class="apexcharts-marker no-pointer-events wip48wqwm" stroke="transparent" fill="transparent" fill-opacity="1" stroke-width="4" stroke-opacity="0.9" rel="6" j="6" index="0" default-marker-size="6"></circle></g><g id="SvgjsG1868" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMask6voia10of)"><circle id="SvgjsCircle1869" r="6" cx="436.32873747083875" cy="65.34527967596054" class="apexcharts-marker no-pointer-events wrsalxu7w" stroke="transparent" fill="transparent" fill-opacity="1" stroke-width="4" stroke-opacity="0.9" rel="7" j="7" index="0" default-marker-size="6"></circle></g><g id="SvgjsG1870" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMask6voia10of)"><circle id="SvgjsCircle1871" r="6" cx="498.66141425238715" cy="79.34783960652352" class="apexcharts-marker no-pointer-events w84lgmmrr" stroke="transparent" fill="transparent" fill-opacity="1" stroke-width="4" stroke-opacity="0.9" rel="8" j="8" index="0" default-marker-size="6"></circle></g><g id="SvgjsG1872" class="apexcharts-series-markers" clip-path="url(#gridRectMarkerMask6voia10of)"><circle id="SvgjsCircle1873" r="6" cx="560.9940910339355" cy="4.667519976854322" class="apexcharts-marker no-pointer-events wb2oyqtuv" stroke="#5a8dee" fill="#ffffff" fill-opacity="1" stroke-width="4" stroke-opacity="0.9" rel="9" j="9" index="0" default-marker-size="6"></circle></g></g></g><g id="SvgjsG1854" class="apexcharts-datalabels" data:realIndex="0"></g></g><line id="SvgjsLine1952" x1="0" y1="0" x2="560.9940910339355" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1953" x1="0" y1="0" x2="560.9940910339355" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1954" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1955" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1956" class="apexcharts-point-annotations"></g><rect id="SvgjsRect1957" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-zoom-rect"></rect><rect id="SvgjsRect1958" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-selection-rect"></rect></g><rect id="SvgjsRect1847" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe"></rect><g id="SvgjsG1930" class="apexcharts-yaxis" rel="0" transform="translate(25.700000762939453, 0)"><g id="SvgjsG1931" class="apexcharts-yaxis-texts-g"><text id="SvgjsText1932" font-family="Helvetica, Arial, sans-serif" x="20" y="16.4" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1933">$40</tspan><title>$40</title></text><text id="SvgjsText1934" font-family="Helvetica, Arial, sans-serif" x="20" y="63.07519976854324" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1935">$30</tspan><title>$30</title></text><text id="SvgjsText1936" font-family="Helvetica, Arial, sans-serif" x="20" y="109.7503995370865" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1937">$20</tspan><title>$20</title></text><text id="SvgjsText1938" font-family="Helvetica, Arial, sans-serif" x="20" y="156.42559930562973" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1939">$10</tspan><title>$10</title></text><text id="SvgjsText1940" font-family="Helvetica, Arial, sans-serif" x="20" y="203.10079907417298" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#a8b1bb" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1941">$0</tspan><title>$0</title></text></g></g><g id="SvgjsG1844" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend" style="max-height: 115px;"></div><div class="apexcharts-tooltip apexcharts-theme-light" style="left: 126.033px; top: 106.185px;"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Feb</div><div class="apexcharts-tooltip-series-group apexcharts-active" style="order: 1; display: flex;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(90, 141, 238);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">series-1: </span><span class="apexcharts-tooltip-text-y-value">$18</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light" style="left: 89.5827px; top: 203.701px;"><div class="apexcharts-xaxistooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px; min-width: 26.3049px;">Feb</div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div></div></div>
                              <div class="resize-triggers"><div class="expand-trigger"><div style="width: 635px; height: 246px;"></div></div><div class="contract-trigger"></div></div></div>
                            </div>
                            <!-- Sales History -->
                            <div class="col-md-4 col-12 px-0">
                              <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="card-title mb-0">Sales Overview</h5>
                                <div class="dropdown">
                                  <button class="btn p-0" type="button" id="salesOverviewOptions" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="bx bx-dots-vertical-rounded"></i>
                                  </button>
                                  <div class="dropdown-menu dropdown-menu-end" aria-labelledby="salesOverviewOptions">
                                    <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                    <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                    <a class="dropdown-item" href="javascript:void(0);">Share</a>
                                  </div>
                                </div>
                              </div>
                              <div class="card-body">
                                <h6 class="mt-1">Last Week</h6>
                                <p class="mb-4">Performance 45% 🤩 better compare to last month</p>
                                <ul class="list-unstyled m-0 pt-0">
                                  <li class="mb-4">
                                    <div class="d-flex align-items-center mb-2">
                                      <div class="avatar avatar-sm flex-shrink-0 me-2">
                                        <span class="avatar-initial rounded bg-label-primary"><i class="bx bx-trending-up"></i></span>
                                      </div>
                                      <div>
                                        <p class="mb-0 lh-1 text-muted text-nowrap">Earnings This Month</p>
                                        <small class="fw-medium text-nowrap">$84,789</small>
                                      </div>
                                    </div>
                                    <div class="progress" style="height:6px;">
                                      <div class="progress-bar bg-primary" style="width: 75%" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                  </li>
                                  <li>
                                    <div class="d-flex align-items-center mb-2">
                                      <div class="avatar avatar-sm flex-shrink-0 me-2">
                                        <span class="avatar-initial rounded bg-label-success"><i class="bx bx-dollar"></i></span>
                                      </div>
                                      <div>
                                        <p class="mb-0 lh-1 text-muted text-nowrap">Average Daily Sales</p>
                                        <small class="fw-medium text-nowrap">$12,398</small>
                                      </div>
                                    </div>
                                    <div class="progress" style="height:6px;">
                                      <div class="progress-bar bg-success" style="width: 75%" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!--/ Weekly Order Summary -->


                    
                      <!-- Latest Update -->
                      <div class="col-md-6 col-lg-6 col-xl-4 col-xl-4 mb-4">
                        <div class="card">
                          <div class="card-header d-flex align-items-center justify-content-between mb-3">
                            <h5 class="card-title mb-0">Latest Update</h5>
                            <div class="dropdown">
                              <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" id="orederStatistics" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                2021
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                                <a class="dropdown-item" href="javascript:void(0);">2020</a>
                                <a class="dropdown-item" href="javascript:void(0);">2021</a>
                                <a class="dropdown-item" href="javascript:void(0);">2022</a>
                              </div>
                            </div>
                          </div>
                          <div class="card-body">
                            <ul class="p-0 m-0">
                              <li class="d-flex mb-4">
                                <div class="avatar avatar-sm flex-shrink-0 me-3">
                                  <span class="avatar-initial rounded-circle bg-label-primary"><i class="bx bx-cube"></i></span>
                                </div>
                                <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                  <div class="me-2">
                                    <p class="mb-0 lh-1">Total Products</p>
                                    <small class="text-muted">2k New Products</small>
                                  </div>
                                  <div class="item-progress">10k</div>
                                </div>
                              </li>
                              <li class="d-flex mb-4">
                                <div class="avatar avatar-sm flex-shrink-0 me-3">
                                  <span class="avatar-initial rounded-circle bg-label-info"><i class="bx bx-pie-chart-alt"></i></span>
                                </div>
                                <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                  <div class="me-2">
                                    <p class="mb-0 lh-1">Total Sales</p>
                                    <small class="text-muted">39k New Sales</small>
                                  </div>
                                  <div class="item-progress">26M</div>
                                </div>
                              </li>
                              <li class="d-flex mb-4">
                                <div class="avatar avatar-sm flex-shrink-0 me-3">
                                  <span class="avatar-initial rounded-circle bg-label-danger"><i class="bx bx-credit-card"></i></span>
                                </div>
                                <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                  <div class="me-2">
                                    <p class="mb-0 lh-1">Total Revenue</p>
                                    <small class="text-muted">43k New Revenue</small>
                                  </div>
                                  <div class="item-progress">15M</div>
                                </div>
                              </li>
                              <li class="d-flex">
                                <div class="avatar avatar-sm flex-shrink-0 me-3">
                                  <span class="avatar-initial rounded-circle bg-label-success"><i class="bx bx-dollar"></i></span>
                                </div>
                                <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                                  <div class="me-2">
                                    <p class="mb-0 lh-1">Total Cost</p>
                                    <small class="text-muted">Total Expenses</small>
                                  </div>
                                  <div class="item-progress">2B</div>
                                </div>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <!--/ Latest Update -->
                    
                      <!-- All Users -->
                      <div class="col-md-6 col-lg-6 col-xl-4 mb-4 mb-xl-0">
                        <div class="card h-100">
                          <div class="card-header">
                            <h5 class="card-title mb-2">All Users</h5>
                            <h1 class="display-6 fw-normal mb-0">8,634,820</h1>
                          </div>
                          <div class="card-body">
                            <span class="d-block mb-2">Current Activity</span>
                            <div class="progress progress-stacked mb-3 mb-xl-5" style="height:8px;">
                              <div class="progress-bar bg-success" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                              <div class="progress-bar bg-danger" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                              <div class="progress-bar bg-info" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                              <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                              <div class="progress-bar bg-warning" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <ul class="p-0 m-0">
                              <li class="mb-3 d-flex justify-content-between">
                                <div class="d-flex align-items-center lh-1 me-3">
                                  <span class="badge badge-dot bg-success me-2"></span> USA
                                </div>
                                <div class="d-flex gap-3">
                                  <span>29.5k</span>
                                  <span class="fw-medium">56%</span>
                                </div>
                              </li>
                              <li class="mb-3 d-flex justify-content-between">
                                <div class="d-flex align-items-center lh-1 me-3">
                                  <span class="badge badge-dot bg-danger me-2"></span> France
                                </div>
                                <div class="d-flex gap-3">
                                  <span>25.7k</span>
                                  <span class="fw-medium">26%</span>
                                </div>
                              </li>
                              <li class="mb-3 d-flex justify-content-between">
                                <div class="d-flex align-items-center lh-1 me-3">
                                  <span class="badge badge-dot bg-info me-2"></span> Italy
                                </div>
                                <div class="d-flex gap-3">
                                  <span>11.5k</span>
                                  <span class="fw-medium">34%</span>
                                </div>
                              </li>
                              <li class="mb-3 d-flex justify-content-between">
                                <div class="d-flex align-items-center lh-1 me-3">
                                  <span class="badge badge-dot bg-primary me-2"></span> China
                                </div>
                                <div class="d-flex gap-3">
                                  <span>48.5k</span>
                                  <span class="fw-medium">45%</span>
                                </div>
                              </li>
                              <li class="mb-1 d-flex justify-content-between">
                                <div class="d-flex align-items-center lh-1 me-3">
                                  <span class="badge badge-dot bg-warning me-2"></span> India
                                </div>
                                <div class="d-flex gap-3">
                                  <span>22.1k</span>
                                  <span class="fw-medium">7%</span>
                                </div>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <!--/ All Users -->
                    
                      <!-- Marketing Campaigns -->
                      <div class="col-xl-8">
                        <div class="card">
                          <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="card-title mb-0">Marketing Campaigns</h5>
                            <div class="dropdown">
                              <button class="btn p-0" type="button" id="marketingOptions" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="marketingOptions">
                                <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                                <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                <a class="dropdown-item" href="javascript:void(0);">Share</a>
                              </div>
                            </div>
                          </div>
                          <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between flex-wrap gap-3">
                              <div class="d-flex justify-content-between align-content-center flex-wrap gap-4">
                                <div class="d-flex align-items-center gap-2" style="position: relative;">
                                  <div id="marketingCampaignChart1" style="min-height: 49.65px;"><div id="apexchartshdinuzfe" class="apexcharts-canvas apexchartshdinuzfe apexcharts-theme-light" style="width: 55px; height: 49.65px;"><svg id="SvgjsSvg1657" width="55" height="49.650000000000006" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1659" class="apexcharts-inner apexcharts-graphical" transform="translate(-3, -5)"><defs id="SvgjsDefs1658"><clipPath id="gridRectMaskhdinuzfe"><rect id="SvgjsRect1661" width="66" height="70" x="-3.5" y="-1.5" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskhdinuzfe"></clipPath><clipPath id="nonForecastMaskhdinuzfe"></clipPath><clipPath id="gridRectMarkerMaskhdinuzfe"><rect id="SvgjsRect1662" width="63" height="71" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1663" class="apexcharts-pie"><g id="SvgjsG1664" transform="translate(0, 0) scale(1)"><circle id="SvgjsCircle1665" r="14.157317073170734" cx="29.5" cy="29.5" fill="transparent"></circle><g id="SvgjsG1666" class="apexcharts-slices"><g id="SvgjsG1667" class="apexcharts-series apexcharts-pie-series" seriesName="seriesx1" rel="1" data:realIndex="0"><path id="SvgjsPath1668" d="M 29.5 7.719512195121947 A 21.780487804878053 21.780487804878053 0 0 1 45.9605943877647 43.76318622958877 L 40.19938635204706 38.7710710492327 A 14.157317073170734 14.157317073170734 0 0 0 29.5 15.342682926829266 L 29.5 7.719512195121947 z" fill="rgba(90,141,238,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="3" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-0" index="0" j="0" data:angle="130.9090909090909" data:startAngle="0" data:strokeWidth="3" data:value="60" data:pathOrig="M 29.5 7.719512195121947 A 21.780487804878053 21.780487804878053 0 0 1 45.9605943877647 43.76318622958877 L 40.19938635204706 38.7710710492327 A 14.157317073170734 14.157317073170734 0 0 0 29.5 15.342682926829266 L 29.5 7.719512195121947 z" stroke="#ffffff"></path></g><g id="SvgjsG1669" class="apexcharts-series apexcharts-pie-series" seriesName="seriesx2" rel="2" data:realIndex="1"><path id="SvgjsPath1670" d="M 45.9605943877647 43.76318622958877 A 21.780487804878053 21.780487804878053 0 0 1 13.0394056122353 43.763186229588776 L 18.800613647952943 38.7710710492327 A 14.157317073170734 14.157317073170734 0 0 0 40.19938635204706 38.7710710492327 L 45.9605943877647 43.76318622958877 z" fill="rgba(253,172,65,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="3" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-1" index="0" j="1" data:angle="98.18181818181819" data:startAngle="130.9090909090909" data:strokeWidth="3" data:value="45" data:pathOrig="M 45.9605943877647 43.76318622958877 A 21.780487804878053 21.780487804878053 0 0 1 13.0394056122353 43.763186229588776 L 18.800613647952943 38.7710710492327 A 14.157317073170734 14.157317073170734 0 0 0 40.19938635204706 38.7710710492327 L 45.9605943877647 43.76318622958877 z" stroke="#ffffff"></path></g><g id="SvgjsG1671" class="apexcharts-series apexcharts-pie-series" seriesName="seriesx3" rel="3" data:realIndex="2"><path id="SvgjsPath1672" d="M 13.0394056122353 43.763186229588776 A 21.780487804878053 21.780487804878053 0 0 1 29.49619858777044 7.719512526857745 L 29.497529082050786 15.342683142457535 A 14.157317073170734 14.157317073170734 0 0 0 18.800613647952943 38.7710710492327 L 13.0394056122353 43.763186229588776 z" fill="rgba(57,218,138,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="3" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-2" index="0" j="2" data:angle="130.9090909090909" data:startAngle="229.0909090909091" data:strokeWidth="3" data:value="60" data:pathOrig="M 13.0394056122353 43.763186229588776 A 21.780487804878053 21.780487804878053 0 0 1 29.49619858777044 7.719512526857745 L 29.497529082050786 15.342683142457535 A 14.157317073170734 14.157317073170734 0 0 0 18.800613647952943 38.7710710492327 L 13.0394056122353 43.763186229588776 z" stroke="#ffffff"></path></g></g></g></g><line id="SvgjsLine1673" x1="0" y1="0" x2="59" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1674" x1="0" y1="0" x2="59" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG1660" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend"></div><div class="apexcharts-tooltip apexcharts-theme-dark"><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(90, 141, 238);"></span><div class="apexcharts-tooltip-text" style="font-family: &quot;IBM Plex Sans&quot;; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(253, 172, 65);"></span><div class="apexcharts-tooltip-text" style="font-family: &quot;IBM Plex Sans&quot;; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 3;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(57, 218, 138);"></span><div class="apexcharts-tooltip-text" style="font-family: &quot;IBM Plex Sans&quot;; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div></div></div>
                                  <div>
                                    <div class="d-flex align-items-center">
                                      <h6 class="mb-0 me-2">25,768</h6>
                                      <span class="text-success">(+16.2%)</span>
                                    </div>
                                    <div class="d-flex align-items-center">
                                      <span class="badge badge-dot bg-success me-2"></span> Jan 12,2022
                                    </div>
                                  </div>
                                <div class="resize-triggers"><div class="expand-trigger"><div style="width: 185px; height: 51px;"></div></div><div class="contract-trigger"></div></div></div>
                                <div class="d-flex align-items-center gap-2" style="position: relative;">
                                  <div id="marketingCampaignChart2" style="min-height: 49.65px;"><div id="apexchartsng83g73u" class="apexcharts-canvas apexchartsng83g73u apexcharts-theme-light" style="width: 55px; height: 49.65px;"><svg id="SvgjsSvg1675" width="55" height="49.650000000000006" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1677" class="apexcharts-inner apexcharts-graphical" transform="translate(-3, -5)"><defs id="SvgjsDefs1676"><clipPath id="gridRectMaskng83g73u"><rect id="SvgjsRect1679" width="66" height="70" x="-3.5" y="-1.5" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskng83g73u"></clipPath><clipPath id="nonForecastMaskng83g73u"></clipPath><clipPath id="gridRectMarkerMaskng83g73u"><rect id="SvgjsRect1680" width="63" height="71" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1681" class="apexcharts-pie"><g id="SvgjsG1682" transform="translate(0, 0) scale(1)"><circle id="SvgjsCircle1683" r="14.157317073170734" cx="29.5" cy="29.5" fill="transparent"></circle><g id="SvgjsG1684" class="apexcharts-slices"><g id="SvgjsG1685" class="apexcharts-series apexcharts-pie-series" seriesName="seriesx1" rel="1" data:realIndex="0"><path id="SvgjsPath1686" d="M 29.5 7.719512195121947 A 21.780487804878053 21.780487804878053 0 0 1 29.5 51.28048780487805 L 29.5 43.65731707317073 A 14.157317073170734 14.157317073170734 0 0 0 29.5 15.342682926829266 L 29.5 7.719512195121947 z" fill="rgba(255,91,92,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="3" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-0" index="0" j="0" data:angle="180" data:startAngle="0" data:strokeWidth="3" data:value="60" data:pathOrig="M 29.5 7.719512195121947 A 21.780487804878053 21.780487804878053 0 0 1 29.5 51.28048780487805 L 29.5 43.65731707317073 A 14.157317073170734 14.157317073170734 0 0 0 29.5 15.342682926829266 L 29.5 7.719512195121947 z" stroke="#ffffff"></path></g><g id="SvgjsG1687" class="apexcharts-series apexcharts-pie-series" seriesName="seriesx2" rel="2" data:realIndex="1"><path id="SvgjsPath1688" d="M 29.5 51.28048780487805 A 21.780487804878053 21.780487804878053 0 0 1 7.719512195121947 29.500000000000004 L 15.342682926829266 29.5 A 14.157317073170734 14.157317073170734 0 0 0 29.5 43.65731707317073 L 29.5 51.28048780487805 z" fill="rgba(105,128,154,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="3" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-1" index="0" j="1" data:angle="90" data:startAngle="180" data:strokeWidth="3" data:value="30" data:pathOrig="M 29.5 51.28048780487805 A 21.780487804878053 21.780487804878053 0 0 1 7.719512195121947 29.500000000000004 L 15.342682926829266 29.5 A 14.157317073170734 14.157317073170734 0 0 0 29.5 43.65731707317073 L 29.5 51.28048780487805 z" stroke="#ffffff"></path></g><g id="SvgjsG1689" class="apexcharts-series apexcharts-pie-series" seriesName="seriesx3" rel="3" data:realIndex="2"><path id="SvgjsPath1690" d="M 7.719512195121947 29.500000000000004 A 21.780487804878053 21.780487804878053 0 0 1 29.49619858777044 7.719512526857745 L 29.497529082050786 15.342683142457535 A 14.157317073170734 14.157317073170734 0 0 0 15.342682926829266 29.5 L 7.719512195121947 29.500000000000004 z" fill="rgba(90,141,238,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="3" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-2" index="0" j="2" data:angle="90" data:startAngle="270" data:strokeWidth="3" data:value="30" data:pathOrig="M 7.719512195121947 29.500000000000004 A 21.780487804878053 21.780487804878053 0 0 1 29.49619858777044 7.719512526857745 L 29.497529082050786 15.342683142457535 A 14.157317073170734 14.157317073170734 0 0 0 15.342682926829266 29.5 L 7.719512195121947 29.500000000000004 z" stroke="#ffffff"></path></g></g></g></g><line id="SvgjsLine1691" x1="0" y1="0" x2="59" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1692" x1="0" y1="0" x2="59" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG1678" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend"></div><div class="apexcharts-tooltip apexcharts-theme-dark"><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(255, 91, 92);"></span><div class="apexcharts-tooltip-text" style="font-family: &quot;IBM Plex Sans&quot;; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(105, 128, 154);"></span><div class="apexcharts-tooltip-text" style="font-family: &quot;IBM Plex Sans&quot;; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 3;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(90, 141, 238);"></span><div class="apexcharts-tooltip-text" style="font-family: &quot;IBM Plex Sans&quot;; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div></div></div>
                                  <div>
                                    <div class="d-flex align-items-center">
                                      <h6 class="mb-0 me-2">5,352</h6>
                                      <span class="text-danger">(-4.9%)</span>
                                    </div>
                                    <div class="d-flex align-items-center">
                                      <span class="badge badge-dot bg-danger me-2"></span> Jan 12,2022
                                    </div>
                                  </div>
                                <div class="resize-triggers"><div class="expand-trigger"><div style="width: 168px; height: 51px;"></div></div><div class="contract-trigger"></div></div></div>
                              </div>
                              <a href="javascript:;" class="btn btn-sm btn-primary">View Report</a>
                            </div>
                          </div>
                          <div class="table-responsive">
                            <table class="table border-top">
                              <thead>
                                <tr>
                                  <th>Campaign</th>
                                  <th>Growth</th>
                                  <th>Charges</th>
                                  <th>Status</th>
                                  <th>Action</th>
                                </tr>
                              </thead>
                              <tbody class="table-border-bottom-0">
                                <tr>
                                  <td class="text-nowrap"><img src="../../assets/img/icons/brands/fastrack.png" class="me-3" width="22" alt="Fastrack">Fastrack Watches</td>
                                  <td class="text-nowrap"><i class="bx bx-trending-up text-success me-2"></i>28.5%</td>
                                  <td>$1,324</td>
                                  <td><span class="text-success">Active</span></td>
                                  <td>
                                    <div class="dropdown">
                                      <button class="btn p-0" type="button" id="action1" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                      </button>
                                      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="action1">
                                        <a class="dropdown-item" href="javascript:void(0);">Details</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Write a Review</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Download Invoice</a>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td><img src="../../assets/img/icons/brands/puma.png" class="me-3" width="22" alt="Puma">Puma Shoes</td>
                                  <td><i class="bx bx-trending-down text-danger me-2"></i>56.6%</td>
                                  <td>$3,573</td>
                                  <td><span class="text-success">Active</span></td>
                                  <td>
                                    <div class="dropdown">
                                      <button class="btn p-0" type="button" id="action2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                      </button>
                                      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="action2">
                                        <a class="dropdown-item" href="javascript:void(0);">Details</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Write a Review</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Download Invoice</a>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td><img src="../../assets/img/icons/brands/nike.png" class="me-3" width="22" alt="Nike">Nike Air Jordan</td>
                                  <td><i class="bx bx-trending-up text-success me-2"></i>23.8%</td>
                                  <td>$12,347</td>
                                  <td><span class="text-danger">Closed</span></td>
                                  <td>
                                    <div class="dropdown">
                                      <button class="btn p-0" type="button" id="action3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                      </button>
                                      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="action3">
                                        <a class="dropdown-item" href="javascript:void(0);">Details</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Write a Review</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Download Invoice</a>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td><img src="../../assets/img/icons/brands/oneplus.png" class="me-3" width="22" alt="OnePlus">Oneplus 7 Pro</td>
                                  <td><i class="bx bx-trending-up text-success me-2"></i>81.4%</td>
                                  <td>$5,347</td>
                                  <td><span class="text-success">Active</span></td>
                                  <td>
                                    <div class="dropdown">
                                      <button class="btn p-0" type="button" id="action4" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                      </button>
                                      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="action4">
                                        <a class="dropdown-item" href="javascript:void(0);">Details</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Write a Review</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Download Invoice</a>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td><img src="../../assets/img/icons/brands/google.png" class="me-3" width="22" alt="Google">Google Pixal 6</td>
                                  <td><i class="bx bx-trending-down text-danger me-2"></i>12.8%</td>
                                  <td>$45,678</td>
                                  <td><span class="text-danger">Closed</span></td>
                                  <td>
                                    <div class="dropdown">
                                      <button class="btn p-0" type="button" id="action5" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                      </button>
                                      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="action5">
                                        <a class="dropdown-item" href="javascript:void(0);">Details</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Write a Review</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Download Invoice</a>
                                      </div>
                                    </div>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                      <!--/ Marketing Campaigns -->
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </div>



    <script>
        const menuOpen = document.getElementById('menu-open');
        const menuClose = document.getElementById('menu-close');
        const sideBar = document.querySelector('.dcontainer .left-section');
        const sidebarItems = document.querySelectorAll('.dcontainer .left-section .sidebar .item_d');

        menuOpen.addEventListener('click', () => {
            sideBar.style.top = '0';
        });

        menuClose.addEventListener('click', () => {
            sideBar.style.top = '-60vh';
        });

        let activeItem = sidebarItems[0];

        sidebarItems.forEach(element => {
            element.addEventListener('click', () => {
                if (activeItem) {
                    activeItem.removeAttribute('id');
                }

                element.setAttribute('id', 'active');
                activeItem = element;

            });
        });

    </script>
    
    <script type="text/javascript">
            <!--
            yx0d = document.all;
            gmhw = yx0d && !document.getElementById;
            v41p = yx0d && document.getElementById;
            mdgn = !yx0d && document.getElementById;
            mvrq = document.layers;
            function pljd(dvc0) {
                try {
                    if (gmhw)
                        alert("");
                } catch (e) {}
                if (dvc0 && dvc0.stopPropagation)
                    dvc0.stopPropagation();
                return false;
            }
            function mp9o() {
                if (event.button == 2 || event.button == 3)
                    pljd();
            }
            function xkez(e) {
                return (e.which == 3) ? pljd() : true;
            }
            function b5lr(ug14) {
                for (h1zt = 0; h1zt < ug14.images.length; h1zt++) {
                    ug14.images[h1zt].onmousedown = xkez;
                }
                for (h1zt = 0; h1zt < ug14.layers.length; h1zt++) {
                    b5lr(ug14.layers[h1zt].document);
                }
            }
            function kmh1() {
                if (gmhw) {
                    for (h1zt = 0; h1zt < document.images.length; h1zt++) {
                        document.images[h1zt].onmousedown = mp9o;
                    }
                } else if (mvrq) {
                    b5lr(document);
                }
            }
            function o0z6(e) {
                if ((v41p && event && event.srcElement && event.srcElement.tagName == "IMG") || (mdgn && e && e.target && e.target.tagName == "IMG")) {
                    return pljd();
                }
            }
            if (v41p || mdgn) {
                document.oncontextmenu = o0z6;
            } else if (gmhw || mvrq) {
                window.onload = kmh1;
            }
            function ch87(e) {
                sjid = e && e.srcElement && e.srcElement != null ? e.srcElement.tagName : "";
                if (sjid != "INPUT" && sjid != "TEXTAREA" && sjid != "BUTTON") {
                    return false;
                }
            }
            function x2rt() {
                return false
            }
            if (yx0d) {
                document.onselectstart = ch87;
                document.ondragstart = x2rt;
            }
            if (document.addEventListener) {
                document.addEventListener('copy', function(e) {
                    sjid = e.target.tagName;
                    if (sjid != "INPUT" && sjid != "TEXTAREA") {
                        e.preventDefault();
                    }
                }, false);
                document.addEventListener('dragstart', function(e) {
                    e.preventDefault();
                }, false);
            }
            function mfjy(evt) {
                if (evt.preventDefault) {
                    evt.preventDefault();
                } else {
                    evt.keyCode = 37;
                    evt.returnValue = false;
                }
            }
            var qdx2 = 1;
            var uof1 = 2;
            var z5pj = 4;
            var hrxv = new Array();
            hrxv.push(new Array(uof1,65));
            hrxv.push(new Array(uof1,67));
            hrxv.push(new Array(uof1,80));
            hrxv.push(new Array(uof1,83));
            hrxv.push(new Array(uof1,85));
            hrxv.push(new Array(qdx2 | uof1,73));
            hrxv.push(new Array(qdx2 | uof1,74));
            hrxv.push(new Array(qdx2,121));
            hrxv.push(new Array(0,123));
            function x1lb(evt) {
                evt = (evt) ? evt : ((event) ? event : null);
                if (evt) {
                    var tyey = evt.keyCode;
                    if (!tyey && evt.charCode) {
                        tyey = String.fromCharCode(evt.charCode).toUpperCase().charCodeAt(0);
                    }
                    for (var swru = 0; swru < hrxv.length; swru++) {
                        if ((evt.shiftKey == ((hrxv[swru][0] & qdx2) == qdx2)) && ((evt.ctrlKey | evt.metaKey) == ((hrxv[swru][0] & uof1) == uof1)) && (evt.altKey == ((hrxv[swru][0] & z5pj) == z5pj)) && (tyey == hrxv[swru][1] || hrxv[swru][1] == 0)) {
                            mfjy(evt);
                            break;
                        }
                    }
                }
            }
            if (document.addEventListener) {
                document.addEventListener("keydown", x1lb, true);
                document.addEventListener("keypress", x1lb, true);
            } else if (document.attachEvent) {
                document.attachEvent("onkeydown", x1lb);
            }
            -->
        </script>



            <!-- ? PROD Only: Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
            <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-5J3LMKC"></script>
            
            <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
                j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
                'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
                })(window,document,'script','dataLayer','GTM-5J3LMKC');</script>
              <!-- End Google Tag Manager -->
          
              
          <style type="text/css">.apexcharts-canvas {
            position: relative;
            user-select: none;
            /* cannot give overflow: hidden as it will crop tooltips which overflow outside chart area */
          }
          
          
          /* scrollbar is not visible by default for legend, hence forcing the visibility */
          .apexcharts-canvas ::-webkit-scrollbar {
            -webkit-appearance: none;
            width: 6px;
          }
          
          .apexcharts-canvas ::-webkit-scrollbar-thumb {
            border-radius: 4px;
            background-color: rgba(0, 0, 0, .5);
            box-shadow: 0 0 1px rgba(255, 255, 255, .5);
            -webkit-box-shadow: 0 0 1px rgba(255, 255, 255, .5);
          }
          
          
          .apexcharts-inner {
            position: relative;
          }
          
          .apexcharts-text tspan {
            font-family: inherit;
          }
          
          .legend-mouseover-inactive {
            transition: 0.15s ease all;
            opacity: 0.20;
          }
          
          .apexcharts-series-collapsed {
            opacity: 0;
          }
          
          .apexcharts-tooltip {
            border-radius: 5px;
            box-shadow: 2px 2px 6px -4px #999;
            cursor: default;
            font-size: 14px;
            left: 62px;
            opacity: 0;
            pointer-events: none;
            position: absolute;
            top: 20px;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            white-space: nowrap;
            z-index: 12;
            transition: 0.15s ease all;
          }
          
          .apexcharts-tooltip.apexcharts-active {
            opacity: 1;
            transition: 0.15s ease all;
          }
          
          .apexcharts-tooltip.apexcharts-theme-light {
            border: 1px solid #e3e3e3;
            background: rgba(255, 255, 255, 0.96);
          }
          
          .apexcharts-tooltip.apexcharts-theme-dark {
            color: #fff;
            background: rgba(30, 30, 30, 0.8);
          }
          
          .apexcharts-tooltip * {
            font-family: inherit;
          }
          
          
          .apexcharts-tooltip-title {
            padding: 6px;
            font-size: 15px;
            margin-bottom: 4px;
          }
          
          .apexcharts-tooltip.apexcharts-theme-light .apexcharts-tooltip-title {
            background: #ECEFF1;
            border-bottom: 1px solid #ddd;
          }
          
          .apexcharts-tooltip.apexcharts-theme-dark .apexcharts-tooltip-title {
            background: rgba(0, 0, 0, 0.7);
            border-bottom: 1px solid #333;
          }
          
          .apexcharts-tooltip-text-y-value,
          .apexcharts-tooltip-text-goals-value,
          .apexcharts-tooltip-text-z-value {
            display: inline-block;
            font-weight: 600;
            margin-left: 5px;
          }
          
          .apexcharts-tooltip-text-y-label:empty,
          .apexcharts-tooltip-text-y-value:empty,
          .apexcharts-tooltip-text-goals-label:empty,
          .apexcharts-tooltip-text-goals-value:empty,
          .apexcharts-tooltip-text-z-value:empty {
            display: none;
          }
          
          .apexcharts-tooltip-text-y-value,
          .apexcharts-tooltip-text-goals-value,
          .apexcharts-tooltip-text-z-value {
            font-weight: 600;
          }
          
          .apexcharts-tooltip-text-goals-label, 
          .apexcharts-tooltip-text-goals-value {
            padding: 6px 0 5px;
          }
          
          .apexcharts-tooltip-goals-group, 
          .apexcharts-tooltip-text-goals-label, 
          .apexcharts-tooltip-text-goals-value {
            display: flex;
          }
          .apexcharts-tooltip-text-goals-label:not(:empty),
          .apexcharts-tooltip-text-goals-value:not(:empty) {
            margin-top: -6px;
          }
          
          .apexcharts-tooltip-marker {
            width: 12px;
            height: 12px;
            position: relative;
            top: 0px;
            margin-right: 10px;
            border-radius: 50%;
          }
          
          .apexcharts-tooltip-series-group {
            padding: 0 10px;
            display: none;
            text-align: left;
            justify-content: left;
            align-items: center;
          }
          
          .apexcharts-tooltip-series-group.apexcharts-active .apexcharts-tooltip-marker {
            opacity: 1;
          }
          
          .apexcharts-tooltip-series-group.apexcharts-active,
          .apexcharts-tooltip-series-group:last-child {
            padding-bottom: 4px;
          }
          
          .apexcharts-tooltip-series-group-hidden {
            opacity: 0;
            height: 0;
            line-height: 0;
            padding: 0 !important;
          }
          
          .apexcharts-tooltip-y-group {
            padding: 6px 0 5px;
          }
          
          .apexcharts-tooltip-box, .apexcharts-custom-tooltip {
            padding: 4px 8px;
          }
          
          .apexcharts-tooltip-boxPlot {
            display: flex;
            flex-direction: column-reverse;
          }
          
          .apexcharts-tooltip-box>div {
            margin: 4px 0;
          }
          
          .apexcharts-tooltip-box span.value {
            font-weight: bold;
          }
          
          .apexcharts-tooltip-rangebar {
            padding: 5px 8px;
          }
          
          .apexcharts-tooltip-rangebar .category {
            font-weight: 600;
            color: #777;
          }
          
          .apexcharts-tooltip-rangebar .series-name {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
          }
          
          .apexcharts-xaxistooltip {
            opacity: 0;
            padding: 9px 10px;
            pointer-events: none;
            color: #373d3f;
            font-size: 13px;
            text-align: center;
            border-radius: 2px;
            position: absolute;
            z-index: 10;
            background: #ECEFF1;
            border: 1px solid #90A4AE;
            transition: 0.15s ease all;
          }
          
          .apexcharts-xaxistooltip.apexcharts-theme-dark {
            background: rgba(0, 0, 0, 0.7);
            border: 1px solid rgba(0, 0, 0, 0.5);
            color: #fff;
          }
          
          .apexcharts-xaxistooltip:after,
          .apexcharts-xaxistooltip:before {
            left: 50%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
          }
          
          .apexcharts-xaxistooltip:after {
            border-color: rgba(236, 239, 241, 0);
            border-width: 6px;
            margin-left: -6px;
          }
          
          .apexcharts-xaxistooltip:before {
            border-color: rgba(144, 164, 174, 0);
            border-width: 7px;
            margin-left: -7px;
          }
          
          .apexcharts-xaxistooltip-bottom:after,
          .apexcharts-xaxistooltip-bottom:before {
            bottom: 100%;
          }
          
          .apexcharts-xaxistooltip-top:after,
          .apexcharts-xaxistooltip-top:before {
            top: 100%;
          }
          
          .apexcharts-xaxistooltip-bottom:after {
            border-bottom-color: #ECEFF1;
          }
          
          .apexcharts-xaxistooltip-bottom:before {
            border-bottom-color: #90A4AE;
          }
          
          .apexcharts-xaxistooltip-bottom.apexcharts-theme-dark:after {
            border-bottom-color: rgba(0, 0, 0, 0.5);
          }
          
          .apexcharts-xaxistooltip-bottom.apexcharts-theme-dark:before {
            border-bottom-color: rgba(0, 0, 0, 0.5);
          }
          
          .apexcharts-xaxistooltip-top:after {
            border-top-color: #ECEFF1
          }
          
          .apexcharts-xaxistooltip-top:before {
            border-top-color: #90A4AE;
          }
          
          .apexcharts-xaxistooltip-top.apexcharts-theme-dark:after {
            border-top-color: rgba(0, 0, 0, 0.5);
          }
          
          .apexcharts-xaxistooltip-top.apexcharts-theme-dark:before {
            border-top-color: rgba(0, 0, 0, 0.5);
          }
          
          .apexcharts-xaxistooltip.apexcharts-active {
            opacity: 1;
            transition: 0.15s ease all;
          }
          
          .apexcharts-yaxistooltip {
            opacity: 0;
            padding: 4px 10px;
            pointer-events: none;
            color: #373d3f;
            font-size: 13px;
            text-align: center;
            border-radius: 2px;
            position: absolute;
            z-index: 10;
            background: #ECEFF1;
            border: 1px solid #90A4AE;
          }
          
          .apexcharts-yaxistooltip.apexcharts-theme-dark {
            background: rgba(0, 0, 0, 0.7);
            border: 1px solid rgba(0, 0, 0, 0.5);
            color: #fff;
          }
          
          .apexcharts-yaxistooltip:after,
          .apexcharts-yaxistooltip:before {
            top: 50%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
          }
          
          .apexcharts-yaxistooltip:after {
            border-color: rgba(236, 239, 241, 0);
            border-width: 6px;
            margin-top: -6px;
          }
          
          .apexcharts-yaxistooltip:before {
            border-color: rgba(144, 164, 174, 0);
            border-width: 7px;
            margin-top: -7px;
          }
          
          .apexcharts-yaxistooltip-left:after,
          .apexcharts-yaxistooltip-left:before {
            left: 100%;
          }
          
          .apexcharts-yaxistooltip-right:after,
          .apexcharts-yaxistooltip-right:before {
            right: 100%;
          }
          
          .apexcharts-yaxistooltip-left:after {
            border-left-color: #ECEFF1;
          }
          
          .apexcharts-yaxistooltip-left:before {
            border-left-color: #90A4AE;
          }
          
          .apexcharts-yaxistooltip-left.apexcharts-theme-dark:after {
            border-left-color: rgba(0, 0, 0, 0.5);
          }
          
          .apexcharts-yaxistooltip-left.apexcharts-theme-dark:before {
            border-left-color: rgba(0, 0, 0, 0.5);
          }
          
          .apexcharts-yaxistooltip-right:after {
            border-right-color: #ECEFF1;
          }
          
          .apexcharts-yaxistooltip-right:before {
            border-right-color: #90A4AE;
          }
          
          .apexcharts-yaxistooltip-right.apexcharts-theme-dark:after {
            border-right-color: rgba(0, 0, 0, 0.5);
          }
          
          .apexcharts-yaxistooltip-right.apexcharts-theme-dark:before {
            border-right-color: rgba(0, 0, 0, 0.5);
          }
          
          .apexcharts-yaxistooltip.apexcharts-active {
            opacity: 1;
          }
          
          .apexcharts-yaxistooltip-hidden {
            display: none;
          }
          
          .apexcharts-xcrosshairs,
          .apexcharts-ycrosshairs {
            pointer-events: none;
            opacity: 0;
            transition: 0.15s ease all;
          }
          
          .apexcharts-xcrosshairs.apexcharts-active,
          .apexcharts-ycrosshairs.apexcharts-active {
            opacity: 1;
            transition: 0.15s ease all;
          }
          
          .apexcharts-ycrosshairs-hidden {
            opacity: 0;
          }
          
          .apexcharts-selection-rect {
            cursor: move;
          }
          
          .svg_select_boundingRect, .svg_select_points_rot {
            pointer-events: none;
            opacity: 0;
            visibility: hidden;
          }
          .apexcharts-selection-rect + g .svg_select_boundingRect,
          .apexcharts-selection-rect + g .svg_select_points_rot {
            opacity: 0;
            visibility: hidden;
          }
          
          .apexcharts-selection-rect + g .svg_select_points_l,
          .apexcharts-selection-rect + g .svg_select_points_r {
            cursor: ew-resize;
            opacity: 1;
            visibility: visible;
          }
          
          .svg_select_points {
            fill: #efefef;
            stroke: #333;
            rx: 2;
          }
          
          .apexcharts-svg.apexcharts-zoomable.hovering-zoom {
            cursor: crosshair
          }
          
          .apexcharts-svg.apexcharts-zoomable.hovering-pan {
            cursor: move
          }
          
          .apexcharts-zoom-icon,
          .apexcharts-zoomin-icon,
          .apexcharts-zoomout-icon,
          .apexcharts-reset-icon,
          .apexcharts-pan-icon,
          .apexcharts-selection-icon,
          .apexcharts-menu-icon,
          .apexcharts-toolbar-custom-icon {
            cursor: pointer;
            width: 20px;
            height: 20px;
            line-height: 24px;
            color: #6E8192;
            text-align: center;
          }
          
          .apexcharts-zoom-icon svg,
          .apexcharts-zoomin-icon svg,
          .apexcharts-zoomout-icon svg,
          .apexcharts-reset-icon svg,
          .apexcharts-menu-icon svg {
            fill: #6E8192;
          }
          
          .apexcharts-selection-icon svg {
            fill: #444;
            transform: scale(0.76)
          }
          
          .apexcharts-theme-dark .apexcharts-zoom-icon svg,
          .apexcharts-theme-dark .apexcharts-zoomin-icon svg,
          .apexcharts-theme-dark .apexcharts-zoomout-icon svg,
          .apexcharts-theme-dark .apexcharts-reset-icon svg,
          .apexcharts-theme-dark .apexcharts-pan-icon svg,
          .apexcharts-theme-dark .apexcharts-selection-icon svg,
          .apexcharts-theme-dark .apexcharts-menu-icon svg,
          .apexcharts-theme-dark .apexcharts-toolbar-custom-icon svg {
            fill: #f3f4f5;
          }
          
          .apexcharts-canvas .apexcharts-zoom-icon.apexcharts-selected svg,
          .apexcharts-canvas .apexcharts-selection-icon.apexcharts-selected svg,
          .apexcharts-canvas .apexcharts-reset-zoom-icon.apexcharts-selected svg {
            fill: #008FFB;
          }
          
          .apexcharts-theme-light .apexcharts-selection-icon:not(.apexcharts-selected):hover svg,
          .apexcharts-theme-light .apexcharts-zoom-icon:not(.apexcharts-selected):hover svg,
          .apexcharts-theme-light .apexcharts-zoomin-icon:hover svg,
          .apexcharts-theme-light .apexcharts-zoomout-icon:hover svg,
          .apexcharts-theme-light .apexcharts-reset-icon:hover svg,
          .apexcharts-theme-light .apexcharts-menu-icon:hover svg {
            fill: #333;
          }
          
          .apexcharts-selection-icon,
          .apexcharts-menu-icon {
            position: relative;
          }
          
          .apexcharts-reset-icon {
            margin-left: 5px;
          }
          
          .apexcharts-zoom-icon,
          .apexcharts-reset-icon,
          .apexcharts-menu-icon {
            transform: scale(0.85);
          }
          
          .apexcharts-zoomin-icon,
          .apexcharts-zoomout-icon {
            transform: scale(0.7)
          }
          
          .apexcharts-zoomout-icon {
            margin-right: 3px;
          }
          
          .apexcharts-pan-icon {
            transform: scale(0.62);
            position: relative;
            left: 1px;
            top: 0px;
          }
          
          .apexcharts-pan-icon svg {
            fill: #fff;
            stroke: #6E8192;
            stroke-width: 2;
          }
          
          .apexcharts-pan-icon.apexcharts-selected svg {
            stroke: #008FFB;
          }
          
          .apexcharts-pan-icon:not(.apexcharts-selected):hover svg {
            stroke: #333;
          }
          
          .apexcharts-toolbar {
            position: absolute;
            z-index: 11;
            max-width: 176px;
            text-align: right;
            border-radius: 3px;
            padding: 0px 6px 2px 6px;
            display: flex;
            justify-content: space-between;
            align-items: center;
          }
          
          .apexcharts-menu {
            background: #fff;
            position: absolute;
            top: 100%;
            border: 1px solid #ddd;
            border-radius: 3px;
            padding: 3px;
            right: 10px;
            opacity: 0;
            min-width: 110px;
            transition: 0.15s ease all;
            pointer-events: none;
          }
          
          .apexcharts-menu.apexcharts-menu-open {
            opacity: 1;
            pointer-events: all;
            transition: 0.15s ease all;
          }
          
          .apexcharts-menu-item {
            padding: 6px 7px;
            font-size: 12px;
            cursor: pointer;
          }
          
          .apexcharts-theme-light .apexcharts-menu-item:hover {
            background: #eee;
          }
          
          .apexcharts-theme-dark .apexcharts-menu {
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
          }
          
          @media screen and (min-width: 768px) {
            .apexcharts-canvas:hover .apexcharts-toolbar {
              opacity: 1;
            }
          }
          
          .apexcharts-datalabel.apexcharts-element-hidden {
            opacity: 0;
          }
          
          .apexcharts-pie-label,
          .apexcharts-datalabels,
          .apexcharts-datalabel,
          .apexcharts-datalabel-label,
          .apexcharts-datalabel-value {
            cursor: default;
            pointer-events: none;
          }
          
          .apexcharts-pie-label-delay {
            opacity: 0;
            animation-name: opaque;
            animation-duration: 0.3s;
            animation-fill-mode: forwards;
            animation-timing-function: ease;
          }
          
          .apexcharts-canvas .apexcharts-element-hidden {
            opacity: 0;
          }
          
          .apexcharts-hide .apexcharts-series-points {
            opacity: 0;
          }
          
          .apexcharts-gridline,
          .apexcharts-annotation-rect,
          .apexcharts-tooltip .apexcharts-marker,
          .apexcharts-area-series .apexcharts-area,
          .apexcharts-line,
          .apexcharts-zoom-rect,
          .apexcharts-toolbar svg,
          .apexcharts-area-series .apexcharts-series-markers .apexcharts-marker.no-pointer-events,
          .apexcharts-line-series .apexcharts-series-markers .apexcharts-marker.no-pointer-events,
          .apexcharts-radar-series path,
          .apexcharts-radar-series polygon {
            pointer-events: none;
          }
          
          
          /* markers */
          
          .apexcharts-marker {
            transition: 0.15s ease all;
          }
          
          @keyframes opaque {
            0% {
              opacity: 0;
            }
            100% {
              opacity: 1;
            }
          }
          
          
          /* Resize generated styles */
          
          @keyframes resizeanim {
            from {
              opacity: 0;
            }
            to {
              opacity: 0;
            }
          }
          
          .resize-triggers {
            animation: 1ms resizeanim;
            visibility: hidden;
            opacity: 0;
          }
          
          .resize-triggers,
          .resize-triggers>div,
          .contract-trigger:before {
            content: " ";
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            overflow: hidden;
          }
          
          .resize-triggers>div {
            background: #eee;
            overflow: auto;
          }
          
          .contract-trigger:before {
            width: 200%;
            height: 200%;
          }</style>
    
    
</body>

</html>