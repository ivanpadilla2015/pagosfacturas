<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::view('/admin', 'layouts.admin')->name('admin');

Route::view('depen', 'dependen.dependencia')->name('depen')->middleware('auth');
Route::view('provee', 'provedores.proveedors')->name('provee')->middleware('auth');
Route::view('tipocon', 'tipocontrato.tipocontra')->name('tipocon')->middleware('auth');

Route::view('contra', 'contrato.contratos')->name('contra')->middleware('auth');

Route::view('consulfa', 'facturas.consultafac')->name('consulfa')->middleware('auth');
Route::view('pagosfa', 'pagos.pagosfac')->name('pagosfa')->middleware('auth');
Route::view('pagonum', 'reportes.pagos_num')->name('pagonum')->middleware('auth');

Route::view('addcontra', 'contrato.adiciones')->name('addcontra')->middleware('auth');

Route::get('repopagoxnum', 'PdfController@index')->name('repopagoxnum')->middleware('auth');
Route::get('pagxnum', 'PdfController@Pdfpagosxnums')->middleware('auth');
Route::get('pdfpagxnum', 'PdfController@Pdfxpagonum')->name('pdfpagxnum')->middleware('auth');
Route::get('pdfinfosuper', 'PdfController@Pdfinformesuper')->name('pdfinfosuper')->middleware('auth');

Route::get('pdfpagos','pdf_pagosController@index')->name('pdfpagos');
Route::get('verpago', 'pdf_pagosController@vistapago')->name('verpago')->middleware('auth');
Route::get('verconpago/{id}', 'pdf_pagosController@Pdfxpagonum')->name('verconpago')->middleware('auth');
Route::get('verinforme/{id}', 'pdf_pagosController@informesuperv')->name('verinforme')->middleware('auth');

Route::view('users', 'usuarios.usuario')->name('users')->middleware('auth');

Route::view('losusos', 'usos.usos')->name('losusos')->middleware('auth');
Route::view('interadmi', 'contra_inter.interadmin')->name('interadmi')->middleware('auth');

Route::view('obliga', 'contrato.obligacion')->name('obliga')->middleware('auth');
Route::get('oblipa/{id}', 'ObligapagosController@Obligaciondepagos')->name('oblipa')->middleware('auth');
Route::get('actualobli', 'ObligapagosController@actualizarobliga')->name('actualobli')->middleware('auth');

