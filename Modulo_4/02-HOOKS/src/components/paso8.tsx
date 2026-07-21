import { useCallback, useState } from 'react'
import { ActivityIndicator, FlatList, SafeAreaView, StyleSheet, Text, View } from 'react-native'

type Servidor = {
  id: string
  nombre: string
  ip: string
  activo: boolean
}

const SERVIDORES: Servidor[] = [
  { id: '1', nombre: 'web-01',   ip: '10.0.2.10', activo: true  },
  { id: '2', nombre: 'web-02',   ip: '10.0.2.11', activo: true  },
  { id: '3', nombre: 'db-primario', ip: '10.0.3.20', activo: true  },
  { id: '4', nombre: 'db-replica',  ip: '10.0.3.21', activo: false },
  { id: '5', nombre: 'cache-01',    ip: '10.0.4.10', activo: true  },
  { id: '6', nombre: 'cache-02',    ip: '10.0.4.11', activo: false },
  { id: '7', nombre: 'lb-01',       ip: '10.0.1.1',  activo: true  },
  { id: '8', nombre: 'bastion',     ip: '203.0.113.5', activo: true },
]

const PAGINA_2: Servidor[] = [
  { id: '9',  nombre: 'monitor-01', ip: '10.0.5.10', activo: true  },
  { id: '10', nombre: 'monitor-02', ip: '10.0.5.11', activo: false },
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

function Separador() {
  return <View style={styles.separador} />
}

function ListaVacia() {
  return (
    <View style={styles.vacio}>
      <Text style={styles.vacioTexto}>Sin servidores registrados</Text>
      <Text style={styles.vacioSub}>Agrega uno con el botón +</Text>
    </View>
  )
}

export default function Paso8() {
  const [datos, setDatos] = useState<Servidor[]>(SERVIDORES)
  const [refrescando, setRefrescando] = useState(false)
  const [cargandoMas, setCargandoMas] = useState(false)
  const [paginaActual, setPaginaActual] = useState(1)

  const onRefresh = useCallback(() => {
    setRefrescando(true)
    setTimeout(() => {
      setDatos(SERVIDORES)
      setPaginaActual(1)
      setRefrescando(false)
    }, 1000)
  }, [])

  const onEndReached = useCallback(() => {
    if (cargandoMas || paginaActual >= 2) return
    setCargandoMas(true)
    setTimeout(() => {
      setDatos((prev) => [...prev, ...PAGINA_2])
      setPaginaActual(2)
      setCargandoMas(false)
    }, 800)
  }, [cargandoMas, paginaActual])

  return (
    <SafeAreaView style={styles.contenedor}>
      <Text style={styles.titulo}>Servidores · p.{paginaActual}</Text>
      <FlatList<Servidor>
        data={datos}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => <FilaServidor servidor={item} />}
        ItemSeparatorComponent={Separador}
        ListEmptyComponent={<ListaVacia />}
        refreshing={refrescando}
        onRefresh={onRefresh}
        onEndReached={onEndReached}
        onEndReachedThreshold={0.3}
        ListFooterComponent={
          cargandoMas ? (
            <ActivityIndicator style={{ margin: 16 }} color="#1565c0" />
          ) : null
        }
      />
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  contenedor: { flex: 1, backgroundColor: '#f0f4f8' },
  titulo: {
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
  separador: {
    height: 1,
    backgroundColor: '#e0e0e0',
    marginHorizontal: 12,
  },
  vacio: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 40,
  },
  vacioTexto: { fontSize: 16, fontWeight: '600', color: '#555' },
  vacioSub: { fontSize: 13, color: '#999', marginTop: 6 },
})
