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
Route::resource('/admin', 'PrincipalController');
//Route::view('/admin', 'layouts.admin')->name('admin');

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
Route::put('actualobli/{id}/update', 'ObligapagosController@upadate')->name('edit.update')->middleware('auth');

Route::view('addrubrocontra', 'contrato.rubrocontrato')->name('addrubrocontra')->middleware('auth');
Route::view('movirubro', 'contrato.movirubros')->name('movirubro')->middleware('auth');
Route::view('traslados', 'contrato.traslado_rubro')->name('traslados')->middleware('auth');

Route::view('repoxcontra', 'Reportes.reportexcontrato')->name('repoxcontra'); 


Route::get('repoxcontraphp', 'Report_contratoController@index')->name('repoxcontraphp');
Route::get('verreporte', 'Report_contratoController@reportexcontrato')->name('verreporte')->middleware('auth');

Route::view('buscontrarubro', 'repocolsultavue.repocontrarubro')->name('buscontrarubro'); 
Route::get('buscontratovue', 'Report_contratoController@buscacontra'); 
Route::get('busrub', 'Report_contratoController@totalrubros'); 

Route::view('riesgo', 'contrato.riesgo')->name('riesgo'); 

Route::get('riesgocon/{id}', 'ObligapagosController@vistariesgos')->middleware('auth');
Route::post('riesgocon/{id}', 'ObligapagosController@grabariesgos')->name('riesgocon')->middleware('auth');

Route::view('maestro', 'maestro.maestro')->name('maestro');

Route::view('confacxfe', 'repocolsultavue.consulfacxfecha')->name('confacxfe'); 
Route::get('busproveevue', 'Report_contratoController@buscaprovee'); 
Route::post('busfac', 'Report_contratoController@buscafacturas')->middleware('auth');

Route::view('suministro', 'pagos.suministros')->name('suministro')->middleware('auth'); 
Route::view('infosumin', 'pagos.informesuministro')->name('infosumin')->middleware('auth'); 

Route::get('verconpagonew/{id}', 'pdf_pagosController@Pdfxpagonumnew')->name('verconpagonew')->middleware('auth');

/************************************************************************************* */
Route::view('copiasriesgos', 'otros.copias_riesgos')->name('copiasriesgos');
Route::view('copiasobligaciones', 'otros.copias_obligacion')->name('copiasobligaciones');
Route::view('borrarpago', 'otros.borrarpago')->name('borrarpago')->middleware('auth'); 
Route::view('editarpago', 'otros.editarpagos')->name('editarpago')->middleware('auth'); 
/******************************************************************************************** */