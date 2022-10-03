<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>H BL.</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="ml-auto mr-auto col-md-5">
                                    <form>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label
                                                    :class="{
                                                        'text-danger':
                                                            errors.cliente_id,
                                                    }"
                                                    >Seleccionar código de
                                                    cliente*</label
                                                >
                                                <el-select
                                                    v-model="
                                                        oReporte.cliente_id
                                                    "
                                                    filterable
                                                    placeholder="Seleccione"
                                                    class="d-block"
                                                    :class="{
                                                        'is-invalid':
                                                            errors.cliente_id,
                                                    }"
                                                >
                                                    <el-option
                                                        v-for="item in listClientes"
                                                        :key="item.id"
                                                        :label="item.file_nro"
                                                        :value="item.id"
                                                    >
                                                    </el-option>
                                                </el-select>
                                                <span
                                                    class="error invalid-feedback"
                                                    v-if="errors.cliente_id"
                                                    v-text="
                                                        errors.cliente_id[0]
                                                    "
                                                ></span>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label
                                                    :class="{
                                                        'text-danger':
                                                            errors.tipo,
                                                    }"
                                                    >Tipo de Impresión*</label
                                                >
                                                <el-select
                                                    v-model="oReporte.tipo"
                                                    filterable
                                                    placeholder="Seleccione"
                                                    class="d-block"
                                                    :class="{
                                                        'is-invalid':
                                                            errors.tipo,
                                                    }"
                                                >
                                                    <el-option
                                                        v-for="item in listTipos"
                                                        :key="item"
                                                        :label="item"
                                                        :value="item"
                                                    >
                                                    </el-option>
                                                </el-select>
                                                <span
                                                    class="error invalid-feedback"
                                                    v-if="errors.tipo"
                                                    v-text="errors.tipo[0]"
                                                ></span>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <el-button
                                                type="primary"
                                                class="bg-lightblue w-full"
                                                :loading="enviando"
                                                @click="generaReporte()"
                                                >{{ textoBtn }}</el-button
                                            >
                                        </div>
                                        <div class="col-md-12">
                                            <el-button
                                                type="default"
                                                class="w-full mt-1"
                                                @click="limpiarFormulario()"
                                                >Reiniciar</el-button
                                            >
                                        </div>
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
            errors: [],
            oReporte: {
                cliente_id: "",
                tipo: "",
            },
            aFechas: [],
            enviando: false,
            textoBtn: "Generar Reporte",
            listClientes: [],
            listTipos: ["ORIGINAL", "COPY NON NEGOTIABLE"],
            errors: [],
        };
    },
    mounted() {
        this.getClientes();
    },
    methods: {
        // obtener lista de clientes
        getClientes() {
            axios.get("/admin/clientes").then((response) => {
                this.listClientes = response.data.clientes;
            });
        },
        limpiarFormulario() {
            this.oReporte.cliente_id = "";
            this.oReporte.tipo = "";
        },
        generaReporte() {
            this.enviando = true;
            let config = {
                responseType: "blob",
            };
            axios
                .post("/admin/hbls/pdf", this.oReporte, config)
                .then((res) => {
                    this.errors = [];
                    this.enviando = false;
                    let pdfBlob = new Blob([res.data], {
                        type: "application/pdf",
                    });
                    let urlReporte = URL.createObjectURL(pdfBlob);
                    window.open(urlReporte);
                })
                .catch(async (error) => {
                    let responseObj = await error.response.data.text();
                    responseObj = JSON.parse(responseObj);
                    this.enviando = false;
                    if (error.response) {
                        if (error.response.status == 422)
                            this.errors = responseObj.errors;
                    }
                });
        },
        obtieneFechas() {
            this.oReporte.fecha_ini = this.aFechas[0];
            this.oReporte.fecha_fin = this.aFechas[1];
        },
    },
};
</script>

<style></style>
