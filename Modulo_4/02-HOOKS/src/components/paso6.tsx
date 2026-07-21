import { useRef, useState, useEffect } from 'react'
import {
  Pressable, ScrollView, StyleSheet,
  Text, TextInput, View, useWindowDimensions, useColorScheme,
  TextInput as RNTextInput,
} from 'react-native'
import { useConexionSimulada } from '@/hooks/useConexionSimulada'

export default function Paso6() {
  const { width } = useWindowDimensions()
  const esquema = useColorScheme()
  const esModoOscuro = esquema === 'dark'
  const colores = {
    fondo:   esModoOscuro ? '#0d1b2a' : '#f0f4f8',
    tarjeta: esModoOscuro ? '#1a2a3a' : '#ffffff',
    texto:   esModoOscuro ? '#e8eaed' : '#1a1a1a',
    detalle: esModoOscuro ? '#9aa0a6' : '#666666',
    borde:   esModoOscuro ? '#2d3e50' : '#e0e0e0',
  }

  const { estado, intentos, latencia, reconectar, reiniciar } =
    useConexionSimulada('postgres-01')

  const inputFiltroRef = useRef<RNTextInput>(null)
  const [filtro, setFiltro] = useState<string>('')

  useEffect(() => {
    const timer = setTimeout(() => { inputFiltroRef.current?.focus() }, 300)
    return () => clearTimeout(timer)
  }, [])

  const [logs, setLogs] = useState<string[]>([])

  useEffect(() => {
    if (estado !== 'conectado') return
    const intervalo = setInterval(() => {
      const ahora = new Date().toLocaleTimeString()
      const eventos = [
        `[${ahora}] Query en ${Math.floor(Math.random() * 50) + 5}ms`,
        `[${ahora}] Conexión desde 10.0.2.1`,
        `[${ahora}] Checkpoint WAL completado`,
        `[${ahora}] Vacío automático en sessions`,
      ]
      setLogs(prev => [eventos[Math.floor(Math.random() * eventos.length)], ...prev].slice(0, 20))
    }, 1500)
    return () => clearInterval(intervalo)
  }, [estado])

  const logsFiltrados = filtro.trim()
    ? logs.filter(l => l.toLowerCase().includes(filtro.toLowerCase()))
    : logs

  const colorConexion: Record<string, string> = {
    desconectado: '#757575', conectando: '#1565c0', conectado: '#2e7d32', error: '#c62828',
  }

  return (
    <View style={[styles.contenedor, { backgroundColor: colores.fondo }]}>
      <Text style={[styles.titulo, { color: colores.texto }]}>Estado del Servidor</Text>

      <View style={[styles.tarjeta, { backgroundColor: colores.tarjeta, borderColor: colorConexion[estado], width: '100%' }]}>
        <View style={{ flexDirection: 'row', justifyContent: 'space-between' }}>
          <Text style={[styles.nombreServidor, { color: colores.texto }]}>postgres-01</Text>
          <Text style={[styles.etiqueta, { color: colorConexion[estado] }]}>{estado.toUpperCase()}</Text>
        </View>
        <Text style={[styles.detalle, { color: colores.detalle }]}>
          10.0.2.50 · PostgreSQL 16 · Puerto 5432
        </Text>
        <Text style={[styles.detalle, { color: colores.detalle }]}>
          Intentos: {intentos}{latencia !== null ? `  ·  ${latencia} ms` : ''}
          {'  ·  '}Tema: {esquema ?? 'sin preferencia'}
        </Text>
        <View style={{ flexDirection: 'row', gap: 8, marginTop: 10 }}>
          <Pressable
            style={({ pressed }) => [
              styles.boton,
              estado === 'conectando' ? styles.botonDeshabilitado : styles.botonActivo,
              pressed && { opacity: 0.75 },
              { flex: 1 },
            ]}
            onPress={reconectar}
            disabled={estado === 'conectando'}
          >
            <Text style={styles.textoBoton}>
              {estado === 'conectando' ? 'Conectando…' : 'Conectar / Reconectar'}
            </Text>
          </Pressable>
          <Pressable
            style={({ pressed }) => [
              { paddingHorizontal: 14, borderRadius: 8, borderWidth: 1, borderColor: colores.borde, justifyContent: 'center' },
              pressed && { opacity: 0.6 },
            ]}
            onPress={reiniciar}
          >
            <Text style={{ color: colores.detalle, fontSize: 13 }}>Reset</Text>
          </Pressable>
        </View>
      </View>

      <TextInput
        ref={inputFiltroRef}
        style={[styles.input, { backgroundColor: colores.tarjeta, borderColor: colores.borde, color: colores.texto, width: '100%' }]}
        value={filtro}
        onChangeText={setFiltro}
        placeholder="Filtrar logs…"
        placeholderTextColor={colores.detalle}
        autoCapitalize="none"
      />

      <ScrollView
        style={{ borderRadius: 8, padding: 12, maxHeight: 220, width: '100%', backgroundColor: esModoOscuro ? '#0a1520' : '#1e1e1e' }}
        showsVerticalScrollIndicator={false}
      >
        {estado !== 'conectado' ? (
          <Text style={{ color: '#666', fontStyle: 'italic', fontSize: 12 }}>
            {estado === 'desconectado' || estado === 'error'
              ? 'Sin conexión — los logs aparecen al conectar'
              : 'Estableciendo conexión…'}
          </Text>
        ) : logsFiltrados.length === 0 ? (
          <Text style={{ color: '#666', fontStyle: 'italic', fontSize: 12 }}>
            Sin entradas que coincidan
          </Text>
        ) : (
          logsFiltrados.map((log, i) => (
            <Text key={i} style={{ fontSize: 11, color: '#a8d8a8', lineHeight: 18 }}>{log}</Text>
          ))
        )}
      </ScrollView>

      <Text style={[styles.detalle, { color: colores.detalle, fontSize: 11 }]}>
        {Math.round(width)} dp · {width > 600 ? 'layout ancho' : 'layout normal'}
      </Text>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    backgroundColor: '#f5f5f5',
    gap: 14,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a1a1a',
  },
  tarjeta: {
    padding: 16,
    borderRadius: 10,
    borderWidth: 2,
    backgroundColor: '#fff',
    gap: 6,
  },
  etiqueta: {
    fontSize: 12,
    fontWeight: '600',
    letterSpacing: 0.5,
  },
  detalle: {
    fontSize: 13,
    color: '#666',
  },
  nombreServidor: {
    fontSize: 15,
    fontWeight: '600',
    color: '#1a1a1a',
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 8,
    paddingHorizontal: 12,
    paddingVertical: 10,
    fontSize: 14,
    backgroundColor: '#fff',
    color: '#1a1a1a',
  },
  boton: {
    paddingVertical: 12,
    borderRadius: 8,
    alignItems: 'center',
    paddingHorizontal: 20,
  },
  botonActivo: {
    backgroundColor: '#1565c0',
  },
  botonDeshabilitado: {
    backgroundColor: '#90a4ae',
  },
  textoBoton: {
    color: '#fff',
    fontWeight: '600',
    fontSize: 14,
  },
})
