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
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Inactive Page</p>
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
            Charts
            <i class="right fas fa-angle-left"></i>
          </p>
        </a>
        <ul class="nav nav-treeview">
          <li class="nav-item">
            <a href="pages/charts/chartjs.html" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>ChartJS</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="pages/charts/flot.html" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Flot</p>
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
    </ul><!--- otro-->
    
  </nav>