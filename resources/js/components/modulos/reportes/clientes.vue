<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Reportes - Lista de Clientes</h1>
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
                                                            errors.filtro,
                                                    }"
                                                    >Seleccione*</label
                                                >
                                                <el-select
                                                    v-model="oReporte.filtro"
                                                    filterable
                                                    placeholder="Seleccione"
                                                    class="d-block"
                                                    :class="{
                                                        'is-invalid':
                                                            errors.filtro,
                                                    }"
                                                >
                                                    <el-option
                                                        v-for="item in listFiltro"
                                                        :key="item"
                                                        :label="item"
                                                        :value="item"
                                                    >
                                                    </el-option>
                                                </el-select>
                                                <span
                                                    class="error invalid-feedback"
                                                    v-if="errors.filtro"
                                                    v-text="errors.filtro[0]"
                                                ></span>
                                            </div>
                                            <div
                                                class="form-group col-md-12"
                                                v-if="
                                                    oReporte.filtro == 'Cliente'
                                                "
                                            >
                                                <label
                                                    :class="{
                                                        'text-danger':
                                                            errors.filtro,
                                                    }"
                                                    >Seleccione*</label
                                                >
                                                <el-select
                                                    v-model="oReporte.cliente"
                                                    filterable
                                                    placeholder="Seleccione"
                                                    class="d-block"
                                                    :class="{
                                                        'is-invalid':
                                                            errors.cliente,
                                                    }"
                                                >
                                                    <el-option
                                                        v-for="item in listClientes"
                                                        :key="item.id"
                                                        :label="
                                                            item.file_nro +
                                                            ' - ' +
                                                            item.cliente
                                                        "
                                                        :value="item.id"
                                                    >
                                                    </el-option>
                                                </el-select>
                                                <span
                                                    class="error invalid-feedback"
                                                    v-if="errors.cliente"
                                                    v-text="errors.cliente[0]"
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
                filtro: "Todos",
                cliente: "",
            },
            aFechas: [],
            enviando: false,
            textoBtn: "Generar Reporte",
            listFiltro: ["Todos", "Cliente"],
            listClientes: [""],
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
            this.oReporte.filtro = "Todos";
        },
        generaReporte() {
            this.enviando = true;
            let config = {
                responseType: "blob",
            };
            axios
                .post("/admin/reportes/clientes", this.oReporte, config)
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
