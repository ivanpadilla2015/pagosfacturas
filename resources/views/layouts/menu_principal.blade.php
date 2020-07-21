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
            <a href="{{ route('addcontra') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Adicionar Contratos
                <?php use App\Adicion; $add_count = Adicion::all()->count(); ?>
                <span class="right badge badge-danger">{{$add_count}}</span>
              </p>
            </a>
          </li>
        </ul>
      </li> <!---   -->
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
            <a href="pages/charts/inline.html" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Inline</p>
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
              <p>Pago Numero
                <?php use App\Pago; $pag_count = Pago::all()->count(); ?>
                <span class="right badge badge-danger">{{$pag_count}}</span>
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="pages/charts/inline.html" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Inline</p>
            </a>
          </li>

          <li class="nav-item">
            <a href="{{ route('repopagoxnum') }}" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Pago Numero2
                
                <span class="right badge badge-danger">{{$pag_count}}</span>
              </p>
            </a>
          </li>


        </ul>
      </li>
    </ul><!--- otro-->
    
  </nav>