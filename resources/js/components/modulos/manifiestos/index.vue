<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Manifiestos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-3">
                                        <router-link
                                            :to="{ name: 'manifiestos.create' }"
                                            v-if="
                                                permisos.includes(
                                                    'manifiestos.create'
                                                )
                                            "
                                            class="btn btn-outline-primary bg-lightblue btn-flat btn-block"
                                        >
                                            <i class="fa fa-plus"></i>
                                            Nuevo
                                        </router-link>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <b-col lg="10" class="my-1">
                                        <b-form-group
                                            label="Buscar"
                                            label-for="filter-input"
                                            label-cols-sm="3"
                                            label-align-sm="right"
                                            label-size="sm"
                                            class="mb-0"
                                        >
                                            <b-input-group size="sm">
                                                <b-form-input
                                                    id="filter-input"
                                                    v-model="filter"
                                                    type="search"
                                                    placeholder="Buscar"
                                                ></b-form-input>

                                                <b-input-group-append>
                                                    <b-button
                                                        class="bg-lightblue"
                                                        variant="primary"
                                                        :disabled="!filter"
                                                        @click="filter = ''"
                                                        >Borrar</b-button
                                                    >
                                                </b-input-group-append>
                                            </b-input-group>
                                        </b-form-group>
                                    </b-col>
                                    <div class="col-md-12">
                                        <b-overlay
                                            :show="showOverlay"
                                            rounded="sm"
                                        >
                                            <b-table
                                                :fields="fields"
                                                :items="listRegistros"
                                                show-empty
                                                stacked="md"
                                                responsive
                                                :current-page="currentPage"
                                                :per-page="perPage"
                                                @filtered="onFiltered"
                                                empty-text="Sin resultados"
                                                empty-filtered-text="Sin resultados"
                                                :filter="filter"
                                            >
                                                <template
                                                    #cell(shipper.nombre)="row"
                                                >
                                                    <span
                                                        v-html="
                                                            row.item.shipper
                                                                .nombre
                                                        "
                                                    ></span>
                                                </template>
                                                <template
                                                    #cell(consignee)="row"
                                                >
                                                    <span
                                                        v-html="
                                                            row.item.consignee
                                                        "
                                                    ></span>
                                                </template>
                                                <template
                                                    #cell(fecha_registro)="row"
                                                >
                                                    {{
                                                        formatoFecha(
                                                            row.item
                                                                .fecha_registro
                                                        )
                                                    }}
                                                </template>
                                                <template #cell(detalles)="row">
                                                    <b-button
                                                        variant="primary"
                                                        size="sm"
                                                        @click="
                                                            row.toggleDetails
                                                        "
                                                    >
                                                        {{
                                                            row.detailsShowing
                                                                ? "Ocultar"
                                                                : "Mostrar"
                                                        }}
                                                        Detalles
                                                    </b-button>
                                                </template>

                                                <template #row-details="row">
                                                    <b-card>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Place Of
                                                                    Delivery:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.cliente
                                                                    .puerto_destino
                                                                    .nombre
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Master Bill
                                                                    Of
                                                                    Loading:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.cliente
                                                                    .master
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Marcas y
                                                                    Números:</b
                                                                ></b-col
                                                            >
                                                            <b-col
                                                                ><span
                                                                    v-html="
                                                                        row.item
                                                                            .marcas_numeros
                                                                    "
                                                                ></span
                                                            ></b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Descripción
                                                                    de la
                                                                    carga:</b
                                                                ></b-col
                                                            >
                                                            <b-col
                                                                ><span
                                                                    v-html="
                                                                        row.item
                                                                            .descripcion
                                                                    "
                                                                ></span
                                                            ></b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Peso (KGS)
                                                                    Gross
                                                                    Weight:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.peso
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Shipper:</b
                                                                ></b-col
                                                            >
                                                            <b-col
                                                                ><span
                                                                    v-html="
                                                                        row.item
                                                                            .shipper_texto
                                                                    "
                                                                ></span
                                                            ></b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Consignee:</b
                                                                ></b-col
                                                            >
                                                            <b-col
                                                                ><span
                                                                    v-html="
                                                                        row.item
                                                                            .consignee2
                                                                    "
                                                                ></span
                                                            ></b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Ocean
                                                                    Vessel:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .ocean_vessel2
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Port Of
                                                                    Loading:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.cliente
                                                                    .puerto_embarque
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Voyage
                                                                    Nro:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .voyage_nro2
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Place Of
                                                                    Delivery:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.cliente
                                                                    .puerto_destino
                                                                    .nombre
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Place Of
                                                                    Issue:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .place_issue2
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Final
                                                                    Destination:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.cliente
                                                                    .destino_final
                                                                    .nombre
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >MBL/HBL:</b
                                                                ></b-col
                                                            >
                                                            <b-col
                                                                ><span
                                                                    v-html="
                                                                        row.item
                                                                            .mbl_hbl
                                                                    "
                                                                ></span
                                                            ></b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Marcas y
                                                                    Números:</b
                                                                ></b-col
                                                            >
                                                            <b-col
                                                                ><span
                                                                    v-html="
                                                                        row.item
                                                                            .marcas_numeros2
                                                                    "
                                                                ></span
                                                            ></b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Descripción
                                                                    de la
                                                                    Carga:</b
                                                                ></b-col
                                                            >
                                                            <b-col>
                                                                <span
                                                                    v-html="
                                                                        row.item
                                                                            .descripcion2
                                                                    "
                                                                ></span
                                                            ></b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Peso (KGS)
                                                                    Gross
                                                                    Weight:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.peso2
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-button
                                                            size="sm"
                                                            variant="primary"
                                                            @click="
                                                                row.toggleDetails
                                                            "
                                                            >Ocultar</b-button
                                                        >
                                                    </b-card>
                                                </template>

                                                <template #cell(accion)="row">
                                                    <div
                                                        class="row justify-content-between"
                                                    >
                                                        <b-button
                                                            size="sm"
                                                            pill
                                                            variant="outline-primary"
                                                            class="btn-flat btn-block"
                                                            title="Archivo PDF"
                                                            @click="
                                                                pdf(row.item.id)
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-file-pdf"
                                                            ></i>
                                                        </b-button>

                                                        <b-button
                                                            size="sm"
                                                            pill
                                                            variant="outline-warning"
                                                            class="btn-flat btn-block"
                                                            title="Editar registro"
                                                            @click="
                                                                editar(
                                                                    row.item.id
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-edit"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar registro"
                                                            @click="
                                                                eliminaManifiesto(
                                                                    row.item.id,
                                                                    row.item
                                                                        .cliente
                                                                        .file_nro
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-trash"
                                                            ></i>
                                                        </b-button>
                                                    </div>
                                                </template>
                                            </b-table>
                                        </b-overlay>
                                        <div class="row">
                                            <b-col
                                                sm="6"
                                                md="2"
                                                class="ml-auto my-1"
                                            >
                                                <b-form-select
                                                    align="right"
                                                    id="per-page-select"
                                                    v-model="perPage"
                                                    :options="pageOptions"
                                                    size="sm"
                                                ></b-form-select>
                                            </b-col>
                                            <b-col
                                                sm="6"
                                                md="2"
                                                class="my-1 mr-auto"
                                                v-if="perPage"
                                            >
                                                <b-pagination
                                                    v-model="currentPage"
                                                    :total-rows="totalRows"
                                                    :per-page="perPage"
                                                    align="left"
                                                ></b-pagination>
                                            </b-col>
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
            permisos: localStorage.getItem("permisos"),
            search: "",
            listRegistros: [],
            showOverlay: false,
            fields: [
                { key: "cliente.file_nro", label: "File Nro.", sortable: true },
                {
                    key: "shipper.nombre",
                    label: "Shipper",
                    sortable: true,
                },
                {
                    key: "consignee",
                    label: "Consignee",
                    sortable: true,
                },
                {
                    key: "ocean_vessel",
                    label: "Ocean Vessel",
                    sortable: true,
                },
                {
                    key: "cliente.puerto_embarque",
                    label: "Port Of Loading",
                    sortable: true,
                },
                {
                    key: "voyage_nro",
                    label: "Voyage Nro.",
                    sortable: true,
                },
                {
                    key: "port_discharge",
                    label: "Por Of Discharge",
                    sortable: true,
                },
                { key: "date_issue", label: "Date Of Issue" },
                {
                    key: "place_issue",
                    label: "Place of Issue",
                    sortable: true,
                },
                {
                    key: "fecha_registro",
                    label: "Fecha de registro",
                    sortable: true,
                },
                { key: "detalles", label: "Ver más" },
                { key: "accion", label: "Acción" },
            ],
            loading: true,
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            currentPage: 1,
            perPage: 10,
            pageOptions: [
                { value: 5, text: "Mostrar 5 Registros" },
                { value: 10, text: "Mostrar 10 Registros" },
                { value: 25, text: "Mostrar 25 Registros" },
                { value: 50, text: "Mostrar 50 Registros" },
                { value: 100, text: "Mostrar 100 Registros" },
                { value: this.totalRows, text: "Mostrar Todo" },
            ],
            totalRows: 10,
            filter: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getManifiestos();
    },
    methods: {
        // Listar Manifiestos
        getManifiestos() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = "/admin/manifiestos";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.manifiestos;
                    this.totalRows = res.data.total;
                });
        },
        eliminaManifiesto(id, descripcion) {
            Swal.fire({
                title: "¿Quierés eliminar este registro?",
                html: `<strong>${descripcion}</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#05568e",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    axios
                        .post("/admin/manifiestos/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.getManifiestos();
                            this.filter = "";
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 1500,
                            });
                        });
                }
            });
        },
        editar(id) {
            this.$router.push({ name: "manifiestos.edit", params: { id: id } });
        },
        pdf(id) {
            let config = {
                responseType: "blob",
            };
            axios
                .post("/admin/manifiestos/pdf/" + id, null, config)
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
                    console.log(error);
                });
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
        formatoFecha(date) {
            return this.$moment(String(date)).format("DD/MM/YYYY");
        },
    },
};
</script>

<style></style>
