<nav class="mt-2">
    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
      <!-- Add icons to the links using the .nav-icon class
           with font-awesome or any other icon font library -->
      <li class="nav-item has-treeview ">
        <a href="#" class="nav-link ">
          <i class="nav-icon fas fa-tachometer-alt"></i>
          <p>
            Contratos
            <i class="right fas fa-angle-left"></i>
          </p>
        </a>
        <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="{{ route('tipocon') }}" class="nav-link ">
              <i class="fas fa-circle nav-icon"></i>
              <p>Tipos Contrato
                <?php use App\Tipocontrato; $tipoc_count = Tipocontrato::all()->count(); ?>
                <span class="right badge badge-danger">{{$tipoc_count}}</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('contra') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Contratos
                <?php use App\Contrato; $con_count = Contrato::all()->count(); ?>
                <span class="right badge badge-danger">{{$con_count}}</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <!--  route('addcontra')   -->
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Adicionar Contratos
                <?php use App\Adicion; $add_count = Adicion::all()->count(); ?>
                <span class="right badge badge-danger">{{$add_count}}</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('interadmi') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Contratos Inter
                <?php use App\Concargo; $car_count = Concargo::all()->count();  ?>
                <span class="right badge badge-danger">{{$car_count}}</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('obliga') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Obligaciones</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('riesgo') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Riesgos</p>
            </a>
          </li>
          
        </ul>
      </li> <!---   -->
      <li class="nav-item has-treeview">
        <a href="#" class="nav-link">
          <i class="nav-icon fas fa-chart-pie"></i>
          <p>
            Movimientos a Rubros
            <i class="right fas fa-angle-left"></i>
          </p>
        </a>
        <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="{{ route('addrubrocontra') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Asignar Rubros a Contratos
                <?php use App\Rubroprin; $rub_count = Rubroprin::all()->count();  ?>
                <span class="right badge badge-danger">{{$rub_count}}</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('movirubro') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Adiciones a Rubro
                <?php //use App\Rubroprin; $rub_count = Rubroprin::all()->count();  ?>
                <span class="right badge badge-danger">{{$rub_count}}</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{route('traslados')}}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Traslados entre Rubro</p>
            </a>
          </li>
        </ul>
      </li>
      <li class="nav-item">
      <a href="{{ route('depen') }}" class="nav-link">
          <i class="nav-icon fas fa-th"></i>
          <p>
            Dependencias
            <?php use App\Dependencia; $depens_count = Dependencia::all()->count(); ?>
          <span class="right badge badge-danger">{{$depens_count}}</span>
          </p>
        </a>
      </li>
      <li class="nav-item">
        <a href="{{ route('provee') }}" class="nav-link">
            <i class="nav-icon fas fa-th"></i>
            <p>
              Proveedores
              <?php use App\Proveedor; $prov_count = Proveedor::all()->count(); ?>
            <span class="right badge badge-danger">{{$prov_count}}</span>
            </p>
          </a>
        </li>
      <li class="nav-item has-treeview">
        <a href="#" class="nav-link">
          <i class="nav-icon fas fa-chart-pie"></i>
          <p>
            Facturas
            <i class="right fas fa-angle-left"></i>
          </p>
        </a>
        <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="{{ route('consulfa') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Consultar Facturas</p>
            </a>
          </li>
          <li class="nav-item">
          <a href="{{route('pagosfa')}}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Pagos</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{route('losusos')}}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Manejo de Usos
                <?php use App\Rubro; $usos_count = Rubro::all()->count(); ?>
                <span class="right badge badge-danger">{{$usos_count}}</span>
              </p>
            </a>
          </li>
        </ul>
      </li>
      <li class="nav-item has-treeview">
        <a href="#" class="nav-link">
          <i class="nav-icon fas fa-chart-pie"></i>
          <p>
            Reportes
            <i class="right fas fa-angle-left"></i>
          </p>
        </a>
        <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Contratos</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('pagonum') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Consulta Pago
                <?php use App\Pago; $pag_count = Pago::all()->count(); ?>
                <span class="right badge badge-danger">{{$pag_count}}</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('pdfpagos') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Pago x Numero
                <?php  $pag_count1 = Pago::all()->count(); ?>
                <span class="right badge badge-danger">{{$pag_count1}}</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('repoxcontraphp') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Totales Rubro Contrato</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('buscontrarubro') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Totales Rubro x Contrato</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('confacxfe') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Facturas x Proveedor</p>
            </a>
          </li>
        </ul>
      </li>
      <li class="nav-item">
        <a href="{{ route('users') }}" class="nav-link">
          <i class="fas fa-circle nav-icon"></i>
          <p>Usuarios
            <?php use App\User; $use_count = User::all()->count(); ?>
            <span class="right badge badge-danger">{{$use_count}}</span>
          </p>
        </a>
      </li>
      <li class="nav-item">
        <a href="{{ route('maestro') }}" class="nav-link">
          <i class="fas fa-circle nav-icon"></i>
          <p>Datos Maestros</p>
        </a>
      </li>

    </ul><!--- otro-->
    
  </nav>