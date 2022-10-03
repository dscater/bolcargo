<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>T CONT - <small>Nuevo</small></h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 p-2">
                        <router-link
                            :to="{ name: 'tconts.index' }"
                            class="btn btn-primary btn-block btn-flat"
                            ><i class="fa fa-arrow-left"></i>
                            Volver</router-link
                        >
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-green">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3
                                            class="card-title text-center w-full"
                                        >
                                            <i class="fas fa-plus"></i>
                                            Nuevo Registro
                                        </h3>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.cliente_id,
                                            }"
                                            >Código del Nro. File*</label
                                        >
                                        <el-select
                                            filterable
                                            class="w-100 d-block"
                                            :class="{
                                                'is-invalid': errors.cliente_id,
                                            }"
                                            v-model="oTcont.cliente_id"
                                            clearable
                                            @change="getCliente"
                                        >
                                            <el-option
                                                v-for="item in listClientes"
                                                :key="item.id"
                                                :value="item.id"
                                                :label="item.file_nro"
                                            >
                                            </el-option>
                                        </el-select>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.cliente_id"
                                            v-text="errors.cliente_id[0]"
                                        ></span>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label>Cnee*</label>
                                        <el-input
                                            v-model="oCliente.cliente"
                                            readonly
                                        ></el-input>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Tipo Embarque*</label>
                                        <el-input
                                            v-model="
                                                oCliente.tipo_embarque.nombre
                                            "
                                            readonly
                                        ></el-input>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.container_nro,
                                            }"
                                            >Container No*</label
                                        >
                                        <el-input
                                            placeholder="Container No"
                                            :class="{
                                                'is-invalid':
                                                    errors.container_nro,
                                            }"
                                            v-model="oTcont.container_nro"
                                            @keypress.enter.native="
                                                enviaRegistro
                                            "
                                            clearable
                                            maxlength="200"
                                            show-word-limit
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.container_nro"
                                            v-text="errors.container_nro[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Qtt*</label>
                                        <el-input
                                            v-model="oCliente.nro_total1"
                                            readonly
                                        ></el-input>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Units*</label>
                                        <el-input
                                            v-model="oCliente.units1.nombre"
                                            readonly
                                        ></el-input>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.container_nro2,
                                            }"
                                            >Container No</label
                                        >
                                        <el-input
                                            placeholder="Container No"
                                            :class="{
                                                'is-invalid':
                                                    errors.container_nro2,
                                            }"
                                            v-model="oTcont.container_nro2"
                                            @keypress.enter.native="
                                                enviaRegistro
                                            "
                                            clearable
                                            maxlength="200"
                                            show-word-limit
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.container_nro2"
                                            v-text="errors.container_nro2[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Qtt*</label>
                                        <el-input
                                            v-model="oCliente.nro_total2"
                                            readonly
                                        ></el-input>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Units*</label>
                                        <el-input
                                            v-model="oCliente.units2.nombre"
                                            readonly
                                        ></el-input>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.container_nro3,
                                            }"
                                            >Container No</label
                                        >
                                        <el-input
                                            placeholder="Container No"
                                            :class="{
                                                'is-invalid':
                                                    errors.container_nro3,
                                            }"
                                            v-model="oTcont.container_nro3"
                                            @keypress.enter.native="
                                                enviaRegistro
                                            "
                                            clearable
                                            maxlength="200"
                                            show-word-limit
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.container_nro3"
                                            v-text="errors.container_nro3[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.container_nro4,
                                            }"
                                            >Container No</label
                                        >
                                        <el-input
                                            placeholder="Container No"
                                            :class="{
                                                'is-invalid':
                                                    errors.container_nro4,
                                            }"
                                            v-model="oTcont.container_nro4"
                                            @keypress.enter.native="
                                                enviaRegistro
                                            "
                                            clearable
                                            maxlength="200"
                                            show-word-limit
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.container_nro4"
                                            v-text="errors.container_nro4[0]"
                                        ></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="bg-green">
                                                    <th
                                                        class="text-center"
                                                        colspan="4"
                                                    >
                                                        INGRESOS
                                                        <button
                                                            class="btn-sm btn-flat btn-primary"
                                                            @click="
                                                                addIngreso()
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-plus"
                                                            ></i>
                                                        </button>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>Documento</th>
                                                    <th>Número</th>
                                                    <th>Monto</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <template
                                                    v-if="
                                                        listIngresos.length > 0
                                                    "
                                                >
                                                    <tr
                                                        v-for="(
                                                            ingreso, index
                                                        ) in listIngresos"
                                                        :key="index"
                                                    >
                                                        <td>
                                                            <el-select
                                                                filterable
                                                                class="w-100 d-block"
                                                                :class="{
                                                                    'is-invalid':
                                                                        errors[
                                                                            'ingresos_documento_id.' +
                                                                                index
                                                                        ],
                                                                }"
                                                                v-model="
                                                                    ingreso.documento_id
                                                                "
                                                                clearable
                                                            >
                                                                <el-option
                                                                    v-for="item in listDocumentos"
                                                                    :key="
                                                                        item.id
                                                                    "
                                                                    :value="
                                                                        item.id
                                                                    "
                                                                    :label="
                                                                        item.nombre
                                                                    "
                                                                >
                                                                </el-option>
                                                            </el-select>
                                                            <span
                                                                class="error invalid-feedback"
                                                                v-if="
                                                                    errors[
                                                                        'ingresos_documento_id.' +
                                                                            index
                                                                    ]
                                                                "
                                                                v-text="
                                                                    errors[
                                                                        'ingresos_documento_id.' +
                                                                            index
                                                                    ][0]
                                                                "
                                                            ></span>
                                                        </td>
                                                        <td>
                                                            <el-input-number
                                                                :class="{
                                                                    'is-invalid':
                                                                        errors[
                                                                            'ingresos_nro.' +
                                                                                index
                                                                        ],
                                                                }"
                                                                class="w-full"
                                                                controls-position="right"
                                                                :min="1"
                                                                :step="0.01"
                                                                placeholder="Número"
                                                                clearable
                                                                v-model="
                                                                    ingreso.nro
                                                                "
                                                            >
                                                            </el-input-number>
                                                            <span
                                                                class="error invalid-feedback"
                                                                v-if="
                                                                    errors[
                                                                        'ingresos_nro.' +
                                                                            index
                                                                    ]
                                                                "
                                                                v-text="
                                                                    errors[
                                                                        'ingresos_nro.' +
                                                                            index
                                                                    ][0]
                                                                "
                                                            ></span>
                                                        </td>
                                                        <td>
                                                            <input
                                                                type="number"
                                                                :class="{
                                                                    'is-invalid':
                                                                        errors[
                                                                            'ingresos_monto.' +
                                                                                index
                                                                        ],
                                                                }"
                                                                :value="
                                                                    ingreso.monto
                                                                "
                                                                min="1"
                                                                step="0.01"
                                                                class="form-control"
                                                                @keyup="
                                                                    enviaIngreso(
                                                                        ingreso,
                                                                        $event
                                                                    )
                                                                "
                                                                @change="
                                                                    enviaIngreso(
                                                                        ingreso,
                                                                        $event
                                                                    )
                                                                "
                                                            />
                                                            <span
                                                                class="error invalid-feedback"
                                                                v-if="
                                                                    errors[
                                                                        'ingresos_monto.' +
                                                                            index
                                                                    ]
                                                                "
                                                                v-text="
                                                                    errors[
                                                                        'ingresos_monto.' +
                                                                            index
                                                                    ][0]
                                                                "
                                                            ></span>
                                                        </td>
                                                        <td>
                                                            <button
                                                                class="btn btn-flat btn-bloc btn-danger btn-sm"
                                                                @click="
                                                                    quitaIngreso(
                                                                        index
                                                                    )
                                                                "
                                                            >
                                                                <i
                                                                    class="fa fa-times"
                                                                ></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </template>
                                                <template v-else>
                                                    <tr>
                                                        <td
                                                            colspan="4"
                                                            class="text-gray text-center font-weight-bold"
                                                        >
                                                            SIN REGISTROS
                                                        </td>
                                                    </tr>
                                                </template>
                                                <tr class="bg-green">
                                                    <td
                                                        class="font-weight-bold text-right"
                                                        colspan="2"
                                                    >
                                                        TOTALES
                                                    </td>
                                                    <td
                                                        class="font-weight-bold text-center"
                                                    >
                                                        {{
                                                            oTcont.total_ingresos
                                                        }}
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-md-6">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="bg-green">
                                                    <th
                                                        class="text-center"
                                                        colspan="4"
                                                    >
                                                        EGRESOS
                                                        <button
                                                            class="btn-sm btn-flat btn-primary"
                                                            @click="addEgreso()"
                                                        >
                                                            <i
                                                                class="fa fa-plus"
                                                            ></i>
                                                        </button>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>Monto</th>
                                                    <th>Número</th>
                                                    <th>Documento</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <template
                                                    v-if="
                                                        listEgresos.length > 0
                                                    "
                                                >
                                                    <tr
                                                        v-for="(
                                                            egreso, index
                                                        ) in listEgresos"
                                                        :key="index"
                                                    >
                                                        <td>
                                                            <input
                                                                type="number"
                                                                :class="{
                                                                    'is-invalid':
                                                                        errors[
                                                                            'egresos_monto.' +
                                                                                index
                                                                        ],
                                                                }"
                                                                :value="
                                                                    egreso.monto
                                                                "
                                                                min="1"
                                                                step="0.01"
                                                                class="form-control"
                                                                @keyup="
                                                                    enviaEgreso(
                                                                        egreso,
                                                                        $event
                                                                    )
                                                                "
                                                                @change="
                                                                    enviaEgreso(
                                                                        egreso,
                                                                        $event
                                                                    )
                                                                "
                                                            />
                                                            <span
                                                                class="error invalid-feedback"
                                                                v-if="
                                                                    errors[
                                                                        'egresos_monto.' +
                                                                            index
                                                                    ]
                                                                "
                                                                v-text="
                                                                    errors[
                                                                        'egresos_monto.' +
                                                                            index
                                                                    ][0]
                                                                "
                                                            ></span>
                                                        </td>
                                                        <td>
                                                            <el-input-number
                                                                :class="{
                                                                    'is-invalid':
                                                                        errors[
                                                                            'egresos_nro.' +
                                                                                index
                                                                        ],
                                                                }"
                                                                class="w-full"
                                                                controls-position="right"
                                                                :min="1"
                                                                :step="0.01"
                                                                placeholder="Número"
                                                                clearable
                                                                v-model="
                                                                    egreso.nro
                                                                "
                                                            >
                                                            </el-input-number>
                                                            <span
                                                                class="error invalid-feedback"
                                                                v-if="
                                                                    errors[
                                                                        'egresos_nro.' +
                                                                            index
                                                                    ]
                                                                "
                                                                v-text="
                                                                    errors[
                                                                        'egresos_nro.' +
                                                                            index
                                                                    ][0]
                                                                "
                                                            ></span>
                                                        </td>
                                                        <td>
                                                            <el-select
                                                                filterable
                                                                class="w-100 d-block"
                                                                :class="{
                                                                    'is-invalid':
                                                                        errors[
                                                                            'egresos_documento_id.' +
                                                                                index
                                                                        ],
                                                                }"
                                                                v-model="
                                                                    egreso.documento_id
                                                                "
                                                                clearable
                                                            >
                                                                <el-option
                                                                    v-for="item in listDocumentos"
                                                                    :key="
                                                                        item.id
                                                                    "
                                                                    :value="
                                                                        item.id
                                                                    "
                                                                    :label="
                                                                        item.nombre
                                                                    "
                                                                >
                                                                </el-option>
                                                            </el-select>
                                                            <span
                                                                class="error invalid-feedback"
                                                                v-if="
                                                                    errors[
                                                                        'egresos_documento_id.' +
                                                                            index
                                                                    ]
                                                                "
                                                                v-text="
                                                                    errors[
                                                                        'egresos_documento_id.' +
                                                                            index
                                                                    ][0]
                                                                "
                                                            ></span>
                                                        </td>
                                                        <td>
                                                            <button
                                                                class="btn btn-flat btn-bloc btn-danger btn-sm"
                                                                @click="
                                                                    quitaEgreso(
                                                                        index
                                                                    )
                                                                "
                                                            >
                                                                <i
                                                                    class="fa fa-times"
                                                                ></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </template>
                                                <template v-else>
                                                    <tr>
                                                        <td
                                                            colspan="4"
                                                            class="text-gray text-center font-weight-bold"
                                                        >
                                                            SIN REGISTROS
                                                        </td>
                                                    </tr>
                                                </template>
                                                <tr class="bg-green">
                                                    <td
                                                        class="font-weight-bold text-center"
                                                    >
                                                        {{
                                                            oTcont.total_egresos
                                                        }}
                                                    </td>

                                                    <td></td>
                                                    <td colspan="2"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-md-6 ml-auto mr-auto">
                                        <label>Profit Final*:</label>
                                        <div class="form-group">
                                            <input
                                                type="number"
                                                class="form-control"
                                                v-model="oTcont.profit"
                                                readonly
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <el-button
                                            class="btn btn-primary bg-primary btn-flat btn-block"
                                            :loading="enviando"
                                            @click="enviaRegistro()"
                                            ><i class="fa fa-save"></i>
                                            Registrar</el-button
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    data() {
        return {
            permisos: localStorage.getItem("permisos"),
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oTcont: {
                cliente_id: "",
                container_nro: "",
                container_nro2: "",
                container_nro3: "",
                container_nro4: "",
                total_ingresos: "",
                total_egresos: "",
                profit: "",
            },
            oCliente: {
                tipo_embarque: {
                    nombre: "",
                },
                puerto_embarque: "",
                puerto_destino: {
                    nombre: "",
                },
                destino_final: {
                    nombre: "",
                },
                units1: {
                    nombre: "",
                },
                units2: {
                    nombre: "",
                },
                master: "",
                cliente: "",
            },
            errors: [],
            listClientes: [],
            listEgresos: [],
            listIngresos: [],
            listDocumentos: [],
            enviando: false,
        };
    },
    mounted() {
        this.getClientes();
        this.getDocumentos();
        this.loadingWindow.close();
        this.calculaTotales();
    },
    methods: {
        // OBTENER EL CLIENTE
        getCliente() {
            if (this.oTcont.cliente_id != "") {
                axios
                    .get("/admin/clientes/getCliente/" + this.oTcont.cliente_id)
                    .then((response) => {
                        this.oCliente = response.data;
                    });
            } else {
                this.oCliente = {
                    tipo_embarque: {
                        nombre: "",
                    },
                    puerto_embarque: "",
                    puerto_destino: {
                        nombre: "",
                    },
                    destino_final: {
                        nombre: "",
                    },
                    units1: {
                        nombre: "",
                    },
                    units2: {
                        nombre: "",
                    },
                    master: "",
                    cliente: "",
                };
            }
        },
        // obtener lista de clientes
        getClientes() {
            axios.get("/admin/clientes").then((response) => {
                this.listClientes = response.data.clientes;
            });
        },

        // obtener lista de documentos
        getDocumentos() {
            axios.get("/admin/get_listas/listaDocumentos").then((response) => {
                this.listDocumentos = response.data;
            });
        },

        // MODIFICA VALORES EGRESOS
        enviaEgreso(item, e) {
            item.monto = parseFloat(e.target.value);
            this.calculaTotalEgresos();
        },
        enviaIngreso(item, e) {
            item.monto = parseFloat(e.target.value);
            this.calculaTotalIngresos();
        },

        // CALCULAR TOTALES
        calculaTotales() {
            this.calculaTotalEgresos();
            this.calculaTotalIngresos();
        },
        calculaTotalEgresos() {
            let suma_total = 0;
            this.oTcont.total_egresos = 0;
            this.listEgresos.forEach((element) => {
                if (element.monto) {
                    suma_total += parseFloat(element.monto);
                }
            });
            this.oTcont.total_egresos = parseFloat(suma_total.toFixed(2));
            this.calculaProfit();
        },
        calculaTotalIngresos() {
            let suma_total = 0;
            this.oTcont.total_ingresos = 0;
            this.listIngresos.forEach((element) => {
                if (element.monto) {
                    suma_total += parseFloat(element.monto);
                }
            });
            this.oTcont.total_ingresos = parseFloat(suma_total.toFixed(2));
            this.calculaProfit();
        },
        calculaProfit() {
            this.oTcont.profit =
                parseFloat(this.oTcont.total_ingresos) -
                parseFloat(this.oTcont.total_egresos);
        },

        // AGREGAR EGRESO
        addEgreso() {
            this.listEgresos.push({
                documento_id: "",
                nro: "",
                monto: parseFloat("1"),
            });
            this.calculaTotalEgresos();
        },
        // AGREGAR INGRESO
        addIngreso() {
            this.listIngresos.push({
                documento_id: "",
                nro: "",
                monto: parseFloat("1"),
            });
            this.calculaTotalIngresos();
        },
        // QUITA REGISTROS
        quitaEgreso(index) {
            this.listEgresos.splice(index, 1);
            this.calculaTotalEgresos();
        },
        quitaIngreso(index) {
            this.listIngresos.splice(index, 1);
            this.calculaTotalIngresos();
        },
        // ENVIAR FORMULARIO
        enviaRegistro() {
            this.enviando = true;
            try {
                let url = "/admin/tconts";
                let formdata = new FormData();
                formdata.append("cliente_id", this.oTcont.cliente_id);
                formdata.append("container_nro", this.oTcont.container_nro);
                formdata.append("container_nro2", this.oTcont.container_nro2);
                formdata.append("container_nro3", this.oTcont.container_nro3);
                formdata.append("container_nro4", this.oTcont.container_nro4);
                formdata.append("total_ingresos", this.oTcont.total_ingresos);
                formdata.append("total_egresos", this.oTcont.total_egresos);
                formdata.append("profit", this.oTcont.profit);

                if (this.listEgresos.length > 0) {
                    this.listEgresos.forEach((element) => {
                        formdata.append(
                            "egresos_documento_id[]",
                            element.documento_id
                        );
                        formdata.append("egresos_nro[]", element.nro);
                        formdata.append("egresos_monto[]", element.monto);
                    });
                }

                if (this.listIngresos.length > 0) {
                    this.listIngresos.forEach((element) => {
                        formdata.append(
                            "ingresos_documento_id[]",
                            element.documento_id
                        );
                        formdata.append("ingresos_nro[]", element.nro);
                        formdata.append("ingresos_monto[]", element.monto);
                    });
                }

                axios
                    .post(url, formdata)
                    .then((res) => {
                        this.enviando = false;
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.errors = [];
                        this.$router.push({ name: "tconts.index" });
                    })
                    .catch((error) => {
                        this.enviando = false;
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                                if (this.errors.ingresos_documento_id) {
                                    Swal.fire({
                                        icon: "error",
                                        title: "Debes ingresar al menos 1 ingreso",
                                        showConfirmButton: false,
                                        timer: 2000,
                                    });
                                }
                            } else {
                                Swal.fire({
                                    icon: "error",
                                    title: error,
                                    showConfirmButton: false,
                                    timer: 2000,
                                });
                            }
                        } else {
                            Swal.fire({
                                icon: "error",
                                title: error,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                        }
                    });
            } catch (e) {
                this.enviando = false;
                console.log(e);
            }
        },
    },
};
</script>

<style></style>
