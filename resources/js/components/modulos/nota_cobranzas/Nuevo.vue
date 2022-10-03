<template>
    <div
        class="modal fade"
        :class="{ show: bModal }"
        id="modal-default"
        aria-modal="true"
        role="dialog"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-lightblue">
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                    <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                        @click="cierraModal"
                    >
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.cliente_id,
                                    }"
                                    >Seleccionar código de cliente*</label
                                >
                                <el-select
                                    filterable
                                    class="w-100 d-block"
                                    :class="{
                                        'is-invalid': errors.cliente_id,
                                    }"
                                    v-model="nota_cobranza.cliente_id"
                                    clearable
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
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.date,
                                    }"
                                    >Date*</label
                                >
                                <input
                                    type="date"
                                    class="form-control"
                                    :class="{ 'is-invalid': errors.date }"
                                    v-model="nota_cobranza.date"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.date"
                                    v-text="errors.date[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.ref,
                                    }"
                                    >Ref*</label
                                >
                                <el-select
                                    class="w-100 d-block"
                                    :class="{
                                        'is-invalid': errors.ref,
                                    }"
                                    v-model="nota_cobranza.ref"
                                    clearable
                                >
                                    <el-option
                                        v-for="(item, index) in listRef"
                                        :key="index"
                                        :value="item"
                                        :label="item"
                                    >
                                    </el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.ref"
                                    v-text="errors.ref[0]"
                                ></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-between">
                    <button
                        type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                        @click="cierraModal"
                    >
                        Cerrar
                    </button>
                    <el-button
                        type="primary"
                        class="bg-lightblue"
                        :loading="enviando"
                        @click="setRegistroModal()"
                        >{{ textoBoton }}</el-button
                    >
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        muestra_modal: {
            type: Boolean,
            default: false,
        },
        accion: {
            type: String,
            default: "nuevo",
        },
        nota_cobranza: {
            type: Object,
            default: {
                id: 0,
                cliente_id: "",
                date: "",
                ref: "",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                this.bModal = true;
            } else {
                this.bModal = false;
            }
        },
    },
    computed: {
        tituloModal() {
            if (this.accion == "nuevo") {
                return "AGREGAR NOTA COBRANZA";
            } else {
                return "MODIFICAR REGISTRO";
            }
        },
        textoBoton() {
            if (this.accion == "nuevo") {
                return "Registrar";
            } else {
                return "Actualizar";
            }
        },
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            bModal: this.muestra_modal,
            enviando: false,
            listRef: ["BOLLP", "BOLOR"],
            listClientes: [],
            errors: [],
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
        this.getClientes();
    },
    methods: {
        // obtener lista de clientes
        getClientes() {
            axios.get("/admin/clientes").then((response) => {
                this.listClientes = response.data.clientes;
            });
        },
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = "/admin/nota_cobranzas";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "cliente_id",
                    this.nota_cobranza.cliente_id
                        ? this.nota_cobranza.cliente_id
                        : ""
                );
                formdata.append(
                    "date",
                    this.nota_cobranza.date ? this.nota_cobranza.date : ""
                );
                formdata.append(
                    "ref",
                    this.nota_cobranza.ref ? this.nota_cobranza.ref : ""
                );
                if (this.accion == "edit") {
                    url = "/admin/nota_cobranzas/" + this.nota_cobranza.id;
                    formdata.append("_method", "PUT");
                }
                axios
                    .post(url, formdata, config)
                    .then((res) => {
                        this.enviando = false;
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.limpiaNotaCobranza();
                        this.$emit("envioModal");
                        this.errors = [];
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
                    })
                    .catch((error) => {
                        this.enviando = false;
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                            }
                        }
                    });
            } catch (e) {
                this.enviando = false;
                console.log(e);
            }
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaNotaCobranza() {
            this.errors = [];
            this.nota_cobranza.cliente_id = "";
            this.nota_cobranza.date = "";
            this.nota_cobranza.ref = "";
        },
    },
};
</script>

<style></style>
