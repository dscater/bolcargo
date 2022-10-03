<template>
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-green elevation-4">
        <!-- Brand Logo -->
        <router-link
            exact
            :to="{ name: 'inicio' }"
            class="brand-link bg-lightblue"
        >
            <img
                :src="configuracion.path_image"
                alt="Logo"
                class="brand-image img-circle elevation-3"
                style="opacity: 0.8"
            />
            <span
                class="brand-text font-weight-light"
                v-text="configuracion.nombre_sistema"
            ></span>
        </router-link>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img
                        :src="user.path_image"
                        class="img-circle elevation-2"
                        alt="User Image"
                    />
                </div>
                <div class="info">
                    <router-link
                        exact
                        :to="{
                            name: 'usuarios.perfil',
                            params: { id: user.id },
                        }"
                        class="d-block"
                        v-text="user.full_name"
                    ></router-link>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input
                        class="form-control form-control-sidebar bg-white"
                        type="search"
                        placeholder="Buscar Modulo"
                        aria-label="Search"
                    />
                    <div class="input-group-append">
                        <button class="btn btn-sidebar bg-white">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul
                    class="nav nav-pills nav-sidebar flex-column text-sm nav-flat"
                    data-widget="treeview"
                    role="menu"
                    data-accordion="false"
                >
                    <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <router-link
                            exact
                            :to="{ name: 'inicio' }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-home"></i>
                            <p>Inicio</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-header"
                        v-if="
                            permisos.includes('proyectos.index') ||
                            permisos.includes('anticipos.index')
                        "
                    >
                        PROYECTOS
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('proyectos.index')"
                    >
                        <router-link
                            exact
                            :to="{ name: 'proyectos.index' }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>Proyectos</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('anticipos.index')"
                    >
                        <router-link
                            :to="{ name: 'anticipos.index' }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>Solicitud de Anticipos</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-header"
                        v-if="
                            permisos.includes('usuarios.index') ||
                            permisos.includes('clientes.index') ||
                            permisos.includes('manifiestos.index') ||
                            permisos.includes('hbls.index') ||
                            permisos.includes('nota_cobranzas.index') ||
                            permisos.includes('certificado_collect.index') ||
                            permisos.includes('tconts.index') ||
                            permisos.includes('configuracion.index')
                        "
                    >
                        ADMINISTRACIÓN
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('usuarios.index')"
                    >
                        <router-link
                            exact
                            :to="{ name: 'usuarios.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-users"></i>
                            <p>Usuarios</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('clientes.index')"
                    >
                        <router-link
                            :to="{ name: 'clientes.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>Clientes</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('manifiestos.index')"
                    >
                        <router-link
                            :to="{ name: 'manifiestos.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>Manifiestos</p>
                        </router-link>
                    </li>
                    <li class="nav-item" v-if="permisos.includes('hbls.index')">
                        <router-link
                            :to="{ name: 'hbls.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>H BL.</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('nota_cobranzas.index')"
                    >
                        <router-link
                            :to="{ name: 'nota_cobranzas.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>Notas de Cobranza</p>
                        </router-link>
                    </li>

                    <li
                        class="nav-item"
                        v-if="permisos.includes('certificado_collect.index')"
                    >
                        <router-link
                            exact
                            :to="{ name: 'certificado_collect.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>C. de F. Marítimo COLLECT</p>
                        </router-link>
                    </li>

                    <li
                        class="nav-item"
                        v-if="permisos.includes('tconts.index')"
                    >
                        <router-link
                            :to="{ name: 'tconts.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>T CONT</p>
                        </router-link>
                    </li>

                    <li
                        class="nav-item"
                        v-if="permisos.includes('configuracion.index')"
                    >
                        <router-link
                            :to="{ name: 'configuracion' }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-cog"></i>
                            <p>Configuración</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-header"
                        v-if="
                            permisos.includes('reportes.usuarios') ||
                            permisos.includes('reportes.clientes') ||
                            permisos.includes('reportes.ingresos_egresos')
                        "
                    >
                        REPORTES
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('reportes.usuarios')"
                    >
                        <router-link
                            :to="{ name: 'reportes.usuarios' }"
                            class="nav-link"
                        >
                            <i class="fas fa-file-pdf nav-icon"></i>
                            <p>Lista de Usuarios</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('reportes.clientes')"
                    >
                        <router-link
                            :to="{ name: 'reportes.clientes' }"
                            class="nav-link"
                        >
                            <i class="fas fa-file-pdf nav-icon"></i>
                            <p>Lista de Clientes</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('reportes.ingresos_egresos')"
                    >
                        <router-link
                            :to="{ name: 'reportes.ingresos_egresos' }"
                            class="nav-link"
                        >
                            <i class="fas fa-file-pdf nav-icon"></i>
                            <p>Ingresos y Egresos</p>
                        </router-link>
                    </li>
                    <li class="nav-header">PERFIL</li>
                    <li class="nav-item">
                        <router-link
                            exact
                            :to="{
                                name: 'usuarios.perfil',
                                params: { id: user.id },
                            }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-user"></i>
                            <p>Ver Perfil</p>
                        </router-link>
                    </li>
                    <li class="nav-header">SALIR</li>
                    <li class="nav-item">
                        <a
                            href="#"
                            class="nav-link"
                            @click.prevent="logout()"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="fas fa-power-off nav-icon"></i>
                            <p>Cerrar sesión</p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
</template>

<script>
export default {
    props: ["user", "configuracion"],
    data() {
        return {
            fullscreenLoading: false,
            permisos: localStorage.getItem("permisos"),
        };
    },
    methods: {
        logout() {
            this.fullscreenLoading = true;
            axios.post("/logout").then((res) => {
                setTimeout(function () {
                    localStorage.clear();
                    location.reload();
                    this.$router.push({ name: "login" });
                }, 500);
            });
        },
    },
};
</script>

<style>
.user-panel .info {
    display: flex;
    height: 100%;
    align-items: center;
}
.user-panel .info a {
    font-size: 0.8em;
}
</style>
