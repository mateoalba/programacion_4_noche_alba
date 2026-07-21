import { SafeAreaView, SectionList, StyleSheet, Text, View } from 'react-native'

type Servidor = {
  id: string
  nombre: string
  ip: string
  activo: boolean
}

type SeccionDatacenter = {
  title: string
  region: string
  data: Servidor[]
}

const SECCIONES: SeccionDatacenter[] = [
  {
    title: 'DC Madrid (EU-West)',
    region: 'eu-west-1',
    data: [
      { id: 's1', nombre: 'web-01',    ip: '10.10.2.10', activo: true  },
      { id: 's2', nombre: 'web-02',    ip: '10.10.2.11', activo: true  },
      { id: 's3', nombre: 'db-master', ip: '10.10.3.20', activo: true  },
    ],
  },
  {
    title: 'DC Frankfurt (EU-Central)',
    region: 'eu-central-1',
    data: [
      { id: 's4', nombre: 'web-01',   ip: '10.20.2.10', activo: true  },
      { id: 's5', nombre: 'cache-01', ip: '10.20.4.10', activo: false },
    ],
  },
  {
    title: 'DC São Paulo (SA-East)',
    region: 'sa-east-1',
    data: [
      { id: 's6', nombre: 'web-01',     ip: '10.30.2.10',  activo: true  },
      { id: 's7', nombre: 'db-replica', ip: '10.30.3.21',  activo: false },
      { id: 's8', nombre: 'bastion',    ip: '203.0.113.6', activo: true  },
    ],
  },
]

function FilaServidor({ servidor }: { servidor: Servidor }) {
  return (
    <View style={styles.fila}>
      <View style={styles.info}>
        <Text style={styles.nombre}>{servidor.nombre}</Text>
        <Text style={styles.ip}>{servidor.ip}</Text>
      </View>
      <View
        style={[
          styles.estado,
          servidor.activo ? styles.estadoActivo : styles.estadoInactivo,
        ]}
      >
        <Text style={styles.textoEstado}>
          {servidor.activo ? 'ACTIVO' : 'CAÍDO'}
        </Text>
      </View>
    </View>
  )
}

function EncabezadoSeccion({ titulo, region }: { titulo: string; region: string }) {
  return (
    <View style={styles.encabezado}>
      <Text style={styles.encabezadoTitulo}>{titulo}</Text>
      <Text style={styles.encabezadoRegion}>{region}</Text>
    </View>
  )
}

export default function Paso9() {
  return (
    <SafeAreaView style={styles.contenedor}>
      <Text style={styles.tituloPantalla}>Infraestructura global</Text>
      <SectionList<Servidor, SeccionDatacenter>
        sections={SECCIONES}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => <FilaServidor servidor={item} />}
        renderSectionHeader={({ section }) => (
          <EncabezadoSeccion titulo={section.title} region={section.region} />
        )}
        stickySectionHeadersEnabled
        ItemSeparatorComponent={() => (
          <View style={{ height: 1, backgroundColor: '#e0e0e0', marginHorizontal: 12 }} />
        )}
        contentContainerStyle={{ paddingBottom: 24 }}
      />
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  contenedor: { flex: 1, backgroundColor: '#f0f4f8' },
  tituloPantalla: {
    fontSize: 20,
    fontWeight: '700',
    padding: 16,
    backgroundColor: '#1565c0',
    color: '#fff',
  },
  fila: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#fff',
    marginHorizontal: 12,
    marginTop: 8,
    borderRadius: 8,
    padding: 12,
  },
  info: { flex: 1 },
  nombre: { fontSize: 15, fontWeight: '600', color: '#1a1a1a' },
  ip: { fontSize: 12, color: '#666', marginTop: 2 },
  estado: {
    borderRadius: 4,
    paddingVertical: 4,
    paddingHorizontal: 8,
  },
  estadoActivo: { backgroundColor: '#e8f5e9' },
  estadoInactivo: { backgroundColor: '#ffebee' },
  textoEstado: { fontSize: 11, fontWeight: '700' },
  encabezado: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: '#e3f2fd',
    paddingHorizontal: 16,
    paddingVertical: 8,
    borderLeftWidth: 3,
    borderLeftColor: '#1565c0',
  },
  encabezadoTitulo: { fontSize: 13, fontWeight: '700', color: '#0d47a1' },
  encabezadoRegion: { fontSize: 11, color: '#546e7a', fontFamily: 'monospace' },
})
