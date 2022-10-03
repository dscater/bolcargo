<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Manifiestos - <small>Nuevo</small></h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 p-2">
                        <router-link
                            :to="{ name: 'manifiestos.index' }"
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
                                <form @submit.prevent="enviaRegistro">
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
                                                    'is-invalid':
                                                        errors.cliente_id,
                                                }"
                                                v-model="oManifiesto.cliente_id"
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
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.shipper_id,
                                                }"
                                                >Shipper*</label
                                            >
                                            <el-select
                                                filterable
                                                class="w-100 d-block"
                                                :class="{
                                                    'is-invalid':
                                                        errors.shipper_id,
                                                }"
                                                v-model="oManifiesto.shipper_id"
                                                clearable
                                            >
                                                <el-option
                                                    v-for="item in listShippers"
                                                    :key="item.id"
                                                    :value="item.id"
                                                    :label="
                                                        parseEnters(item.nombre)
                                                    "
                                                >
                                                </el-option>
                                            </el-select>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.shipper_id"
                                                v-text="errors.shipper_id[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.consignee,
                                                }"
                                                >Consignee*</label
                                            >
                                            <el-input
                                                type="textarea"
                                                :autosize="{ minRows: 4 }"
                                                placeholder="Notas"
                                                :class="{
                                                    'is-invalid':
                                                        errors.consignee,
                                                }"
                                                v-model="oManifiesto.consignee"
                                                clearable
                                                maxlength="4000"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.consignee"
                                                v-text="errors.consignee[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.ocean_vessel,
                                                }"
                                                >Ocean Vessel*</label
                                            >
                                            <el-input
                                                placeholder="Ocean Vessel"
                                                :class="{
                                                    'is-invalid':
                                                        errors.ocean_vessel,
                                                }"
                                                v-model="
                                                    oManifiesto.ocean_vessel
                                                "
                                                clearable
                                                maxlength="200"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.ocean_vessel"
                                                v-text="errors.ocean_vessel[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Port Of Loading*</label>
                                            <el-input
                                                placeholder="Port Of Loading"
                                                clearable
                                                readonly
                                                v-model="
                                                    oCliente.puerto_embarque
                                                "
                                            >
                                            </el-input>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.voyage_nro,
                                                }"
                                                >Voyage Nro.*</label
                                            >
                                            <el-input
                                                placeholder="Voyage Nro."
                                                :class="{
                                                    'is-invalid':
                                                        errors.voyage_nro,
                                                }"
                                                v-model="oManifiesto.voyage_nro"
                                                clearable
                                                maxlength="200"
                                                autocomplete
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.voyage_nro"
                                                v-text="errors.voyage_nro[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.port_discharge,
                                                }"
                                                >Port Of Discharge*</label
                                            >
                                            <el-select
                                                filterable
                                                class="w-100 d-block"
                                                :class="{
                                                    'is-invalid':
                                                        errors.port_discharge,
                                                }"
                                                v-model="
                                                    oManifiesto.port_discharge
                                                "
                                                clearable
                                            >
                                                <el-option
                                                    v-for="item in listPortDischarges"
                                                    :key="item"
                                                    :value="item"
                                                    :label="item"
                                                >
                                                </el-option>
                                            </el-select>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.port_discharge"
                                                v-text="
                                                    errors.port_discharge[0]
                                                "
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.date_issue,
                                                }"
                                                >Date Of Issue*</label
                                            >
                                            <input
                                                type="date"
                                                class="form-control"
                                                :class="{
                                                    'is-invalid':
                                                        errors.date_issue,
                                                }"
                                                name="date_issue"
                                                v-model="oManifiesto.date_issue"
                                            />
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.date_issue"
                                                v-text="errors.date_issue[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.place_issue,
                                                }"
                                                >Place Of Issue*</label
                                            >
                                            <el-input
                                                placeholder="Place Of Issue"
                                                :class="{
                                                    'is-invalid':
                                                        errors.place_issue,
                                                }"
                                                v-model="
                                                    oManifiesto.place_issue
                                                "
                                                clearable
                                                maxlength="200"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.place_issue"
                                                v-text="errors.place_issue[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Port Of Delivery*</label>
                                            <el-input
                                                placeholder="Port Of Delivery"
                                                clearable
                                                readonly
                                                v-model="
                                                    oCliente.puerto_destino
                                                        .nombre
                                                "
                                            >
                                            </el-input>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                >Master Bill Of Loading*</label
                                            >
                                            <el-input
                                                placeholder="Master Bill Of Loading"
                                                readonly
                                                v-model="oCliente.master"
                                            >
                                            </el-input>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.marcas_numeros,
                                                }"
                                                >Marcas y Números*</label
                                            >
                                            <el-input
                                                type="textarea"
                                                :autosize="{ minRows: 4 }"
                                                placeholder="Notas"
                                                :class="{
                                                    'is-invalid':
                                                        errors.marcas_numeros,
                                                }"
                                                v-model="
                                                    oManifiesto.marcas_numeros
                                                "
                                                clearable
                                                maxlength="4000"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.marcas_numeros"
                                                v-text="
                                                    errors.marcas_numeros[0]
                                                "
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.descripcion,
                                                }"
                                                >Descripción de la Carga*</label
                                            >
                                            <el-input
                                                type="textarea"
                                                :autosize="{ minRows: 4 }"
                                                placeholder="Notas"
                                                :class="{
                                                    'is-invalid':
                                                        errors.descripcion,
                                                }"
                                                v-model="
                                                    oManifiesto.descripcion
                                                "
                                                clearable
                                                maxlength="4000"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.descripcion"
                                                v-text="errors.descripcion[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger': errors.peso,
                                                }"
                                                >Peso (KGS) Gross Weight*</label
                                            >
                                            <el-input-number
                                                v-model="oManifiesto.peso"
                                                class="w-full"
                                                :class="{
                                                    'is-invalid': errors.peso,
                                                }"
                                                controls-position="right"
                                                :min="1"
                                                :step="0.01"
                                            ></el-input-number>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.peso"
                                                v-text="errors.peso[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.shipper_texto,
                                                }"
                                                >Shipper*</label
                                            >
                                            <el-input
                                                type="textarea"
                                                :autosize="{ minRows: 4 }"
                                                placeholder="Shipper"
                                                :class="{
                                                    'is-invalid':
                                                        errors.shipper_texto,
                                                }"
                                                v-model="
                                                    oManifiesto.shipper_texto
                                                "
                                                clearable
                                                maxlength="4000"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.shipper_texto"
                                                v-text="errors.shipper_texto[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.consignee2,
                                                }"
                                                >Consignee*</label
                                            >
                                            <el-input
                                                type="textarea"
                                                :autosize="{ minRows: 4 }"
                                                :class="{
                                                    'is-invalid':
                                                        errors.consignee2,
                                                }"
                                                v-model="oManifiesto.consignee2"
                                                clearable
                                                maxlength="4000"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.consignee2"
                                                v-text="errors.consignee2[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.ocean_vessel2,
                                                }"
                                                >Ocean Vessel*</label
                                            >
                                            <el-input
                                                placeholder="Ocean Vessel"
                                                :class="{
                                                    'is-invalid':
                                                        errors.ocean_vessel2,
                                                }"
                                                v-model="
                                                    oManifiesto.ocean_vessel2
                                                "
                                                clearable
                                                maxlength="200"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.ocean_vessel2"
                                                v-text="errors.ocean_vessel2[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Port Of Loading*</label>
                                            <el-input
                                                placeholder="Port Of Loading"
                                                v-model="
                                                    oCliente.puerto_embarque
                                                "
                                                readonly
                                            >
                                            </el-input>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.voyage_nro2,
                                                }"
                                                >Voyage Nro.*</label
                                            >
                                            <el-input
                                                placeholder="Voyage Nro."
                                                :class="{
                                                    'is-invalid':
                                                        errors.voyage_nro2,
                                                }"
                                                v-model="
                                                    oManifiesto.voyage_nro2
                                                "
                                                clearable
                                                maxlength="200"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.voyage_nro2"
                                                v-text="errors.voyage_nro2[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Port Of Delivery*</label>
                                            <el-input
                                                placeholder="Port Of Delivery"
                                                v-model="
                                                    oCliente.puerto_destino
                                                        .nombre
                                                "
                                                readonly
                                            >
                                            </el-input>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.place_issue2,
                                                }"
                                                >Place Of Issue*</label
                                            >
                                            <el-input
                                                placeholder="Place Of Issue"
                                                :class="{
                                                    'is-invalid':
                                                        errors.place_issue2,
                                                }"
                                                v-model="
                                                    oManifiesto.place_issue2
                                                "
                                                clearable
                                                maxlength="200"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.place_issue2"
                                                v-text="errors.place_issue2[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Final Destination*</label>
                                            <el-input
                                                placeholder="Final Destination"
                                                v-model="
                                                    oCliente.destino_final
                                                        .nombre
                                                "
                                                readonly
                                            >
                                            </el-input>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.mbl_hbl,
                                                }"
                                                >MBL/HBL*</label
                                            >
                                            <el-input
                                                type="textarea"
                                                :autosize="{ minRows: 4 }"
                                                :class="{
                                                    'is-invalid':
                                                        errors.mbl_hbl,
                                                }"
                                                v-model="oManifiesto.mbl_hbl"
                                                clearable
                                                maxlength="2000"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.mbl_hbl"
                                                v-text="errors.mbl_hbl[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.marcas_numeros2,
                                                }"
                                                >Marcas y Números*</label
                                            >
                                            <el-input
                                                type="textarea"
                                                :autosize="{ minRows: 4 }"
                                                :class="{
                                                    'is-invalid':
                                                        errors.marcas_numeros2,
                                                }"
                                                v-model="
                                                    oManifiesto.marcas_numeros2
                                                "
                                                clearable
                                                maxlength="2000"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.marcas_numeros2"
                                                v-text="
                                                    errors.marcas_numeros2[0]
                                                "
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger':
                                                        errors.descripcion2,
                                                }"
                                                >Descripción de la Carga*</label
                                            >
                                            <el-input
                                                type="textarea"
                                                :autosize="{ minRows: 4 }"
                                                :class="{
                                                    'is-invalid':
                                                        errors.descripcion2,
                                                }"
                                                v-model="
                                                    oManifiesto.descripcion2
                                                "
                                                clearable
                                                maxlength="2000"
                                            >
                                            </el-input>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.descripcion2"
                                                v-text="errors.descripcion2[0]"
                                            ></span>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label
                                                :class="{
                                                    'text-danger': errors.peso2,
                                                }"
                                                >Peso (KGS) Gross Weight*</label
                                            >
                                            <el-input-number
                                                v-model="oManifiesto.peso2"
                                                class="w-full"
                                                :class="{
                                                    'is-invalid': errors.peso2,
                                                }"
                                                controls-position="right"
                                                :min="1"
                                                :step="0.01"
                                            ></el-input-number>
                                            <span
                                                class="error invalid-feedback"
                                                v-if="errors.peso2"
                                                v-text="errors.peso2[0]"
                                            ></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <el-button
                                                native-type="submit"
                                                class="btn btn-primary bg-primary btn-flat btn-block"
                                                :loading="enviando"
                                                ><i class="fa fa-save"></i>
                                                Registrar</el-button
                                            >
                                        </div>
                                    </div>
                                </form>
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
            oManifiesto: {
                cliente_id: "",
                shipper_id: "",
                consignee: "",
                ocean_vessel: "",
                voyage_nro: "",
                port_discharge: "",
                date_issue: "",
                place_issue: "",
                marcas_numeros: "",
                descripcion: "",
                peso: "",
                shipper_texto: "",
                consignee2: "",
                ocean_vessel2: "",
                voyage_nro2: "",
                place_issue2: "",
                mbl_hbl: "",
                marcas_numeros2: "",
                descripcion2: "",
                peso2: "",
            },
            oCliente: {
                puerto_embarque: "",
                puerto_destino: {
                    nombre: "",
                },
                destino_final: {
                    nombre: "",
                },
                master: "",
                cliente: "",
            },
            errors: [],
            listShippers: [],
            listClientes: [],
            listPortDischarges: ["IQUIQUE", "ARICA"],
            enviando: false,
        };
    },
    mounted() {
        this.getShippers();
        this.getClientes();
        this.loadingWindow.close();
    },
    methods: {
        parseEnters(value) {
            return value.replace(/<br\s*[\/]?>/gi, "");
        },
        // OBTENER EL CLIENTE
        getCliente() {
            if (this.oManifiesto.cliente_id != "") {
                axios
                    .get(
                        "/admin/clientes/getCliente/" +
                            this.oManifiesto.cliente_id
                    )
                    .then((response) => {
                        this.oCliente = response.data;
                        this.oManifiesto.mbl_hbl =
                            this.oCliente.master + "\n" + this.oCliente.house;
                        this.oManifiesto.consignee2 = this.oCliente.cliente;
                    });
            } else {
                this.oCliente = {
                    puerto_embarque: "",
                    puerto_destino: {
                        nombre: "",
                    },
                    destino_final: {
                        nombre: "",
                    },
                    master: "",
                };
                this.oManifiesto = "";
                this.oManifiesto.consignee2 = "";
            }
        },
        // obtener lista de shippers
        getShippers() {
            axios.get("/admin/get_listas/listaShippers").then((response) => {
                this.listShippers = response.data;
            });
        },
        // obtener lista de clientes
        getClientes() {
            axios.get("/admin/clientes").then((response) => {
                this.listClientes = response.data.clientes;
            });
        },
        // ENVIAR FORMULARIO
        enviaRegistro() {
            this.enviando = true;
            try {
                let url = "/admin/manifiestos";
                let formdata = new FormData();
                formdata.append("cliente_id", this.oManifiesto.cliente_id);
                formdata.append("shipper_id", this.oManifiesto.shipper_id);
                formdata.append("consignee", this.oManifiesto.consignee);
                formdata.append("ocean_vessel", this.oManifiesto.ocean_vessel);
                formdata.append("voyage_nro", this.oManifiesto.voyage_nro);
                formdata.append(
                    "port_discharge",
                    this.oManifiesto.port_discharge
                );
                formdata.append("date_issue", this.oManifiesto.date_issue);
                formdata.append("place_issue", this.oManifiesto.place_issue);
                formdata.append(
                    "marcas_numeros",
                    this.oManifiesto.marcas_numeros
                );
                formdata.append("descripcion", this.oManifiesto.descripcion);
                formdata.append("peso", this.oManifiesto.peso);
                formdata.append(
                    "shipper_texto",
                    this.oManifiesto.shipper_texto
                );
                formdata.append("consignee2", this.oManifiesto.consignee2);
                formdata.append(
                    "ocean_vessel2",
                    this.oManifiesto.ocean_vessel2
                );
                formdata.append("voyage_nro2", this.oManifiesto.voyage_nro2);
                formdata.append("place_issue2", this.oManifiesto.place_issue2);
                formdata.append("mbl_hbl", this.oManifiesto.mbl_hbl);
                formdata.append(
                    "marcas_numeros2",
                    this.oManifiesto.marcas_numeros2
                );
                formdata.append("descripcion2", this.oManifiesto.descripcion2);
                formdata.append("peso2", this.oManifiesto.peso2);

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
                        this.$router.push({ name: "manifiestos.index" });
                    })
                    .catch((error) => {
                        this.enviando = false;
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                            } else if (error.response.status === 400) {
                                Swal.fire({
                                    icon: "error",
                                    title: error.response.data.msj,
                                    showConfirmButton: false,
                                    timer: 2000,
                                });
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

<style>
.el-scrollbar__view.el-select-dropdown__list {
    width: 600px;
}

.el-select-dropdown__item {
    width: 100%;
    overflow: hidden;
}

@media (max-width: 800px) {
    .el-scrollbar__view.el-select-dropdown__list {
        width: 300px;
    }
}
</style>
