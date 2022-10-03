import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

export default new Router({
    routes: [
        // INICIO
        {
            path: '/',
            name: 'inicio',
            component: require('./components/Inicio.vue').default
        },

        // LOGIN
        {
            path: '/login',
            name: 'login',
            component: require('./Auth.vue').default
        },

        // USUARIOS
        {
            path: '/usuarios/perfil/:id',
            name: 'usuarios.perfil',
            component: require('./components/modulos/usuarios/perfil.vue').default,
            props: true
        },
        {
            path: '/usuarios',
            name: 'usuarios.index',
            component: require('./components/modulos/usuarios/index.vue').default
        },

        // CLIENTES
        {
            path: '/clientes',
            name: 'clientes.index',
            component: require('./components/modulos/clientes/index.vue').default,
        },
        {
            path: '/clientes/create',
            name: 'clientes.create',
            component: require('./components/modulos/clientes/create.vue').default,
        },
        {
            path: '/clientes/edit/:id',
            name: 'clientes.edit',
            props: true,
            component: require('./components/modulos/clientes/edit.vue').default,
        },

        // MANIFIESTOS
        {
            path: '/manifiestos',
            name: 'manifiestos.index',
            component: require('./components/modulos/manifiestos/index.vue').default,
        },
        {
            path: '/manifiestos/create',
            name: 'manifiestos.create',
            component: require('./components/modulos/manifiestos/create.vue').default,
        },

        {
            path: '/manifiestos/edit/:id',
            name: 'manifiestos.edit',
            props: true,
            component: require('./components/modulos/manifiestos/edit.vue').default,
        },

        // HBLS
        {
            path: '/hbls',
            name: 'hbls.index',
            component: require('./components/modulos/hbls/index.vue').default,
        },

        // NOTAS DE COBRANZAS
        {
            path: '/nota_cobranzas',
            name: 'nota_cobranzas.index',
            component: require('./components/modulos/nota_cobranzas/index.vue').default
        },

        // CERTIFICADO COLLET
        {
            path: '/certificado_collect',
            name: 'certificado_collect.index',
            component: require('./components/modulos/certificado_collect/index.vue').default,
        },

        // TCONTS
        {
            path: '/tconts',
            name: 'tconts.index',
            component: require('./components/modulos/tconts/index.vue').default,
        },
        {
            path: '/tconts/create',
            name: 'tconts.create',
            component: require('./components/modulos/tconts/create.vue').default,
        },
        {
            path: '/tconts/edit/:id',
            name: 'tconts.edit',
            props: true,
            component: require('./components/modulos/tconts/edit.vue').default,
        },

        // CONFIGURACIÓN
        {
            path: '/configuracion',
            name: 'configuracion',
            component: require('./components/modulos/configuracion/index.vue').default,
            props: true
        },

        // REPORTES
        {
            path: '/reportes/usuarios',
            name: 'reportes.usuarios',
            component: require('./components/modulos/reportes/usuarios.vue').default,
            props: true
        },
        {
            path: '/reportes/clientes',
            name: 'reportes.clientes',
            component: require('./components/modulos/reportes/clientes.vue').default,
            props: true
        },
        {
            path: '/reportes/ingresos_egresos',
            name: 'reportes.ingresos_egresos',
            component: require('./components/modulos/reportes/ingresos_egresos.vue').default,
            props: true
        },

        // PÁGINA NO ENCONTRADA
        {
            path: '*',
            component: require('./components/modulos/errors/404.vue').default
        },
    ],
    mode: 'history',
    linkActiveClass: 'active'
});