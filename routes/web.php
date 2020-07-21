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

Route::view('depen', 'dependen.dependencia')->name('depen');
Route::view('provee', 'provedores.proveedors')->name('provee');
Route::view('tipocon', 'tipocontrato.tipocontra')->name('tipocon');

Route::view('contra', 'contrato.contratos')->name('contra');

Route::view('consulfa', 'facturas.consultafac')->name('consulfa');
Route::view('pagosfa', 'pagos.pagosfac')->name('pagosfa');
Route::view('pagonum', 'reportes.pagos_num')->name('pagonum');

Route::view('addcontra', 'contrato.adiciones')->name('addcontra');

Route::get('repopagoxnum', 'PdfController@index')->name('repopagoxnum');
Route::get('pagxnum', 'PdfController@Pdfpagosxnums');
Route::get('pdfpagxnum', 'PdfController@Pdfxpagonum')->name('pdfpagxnum');
Route::get('pdfinfosuper', 'PdfController@Pdfinformesuper')->name('pdfinfosuper');