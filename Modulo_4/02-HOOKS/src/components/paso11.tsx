import { useState } from 'react'
import {
  Alert, Pressable, SafeAreaView, ScrollView, StyleSheet, Text, TextInput, View,
} from 'react-native'

const REGEX_IPV4 = /^(\d{1,3}\.){3}\d{1,3}$/

type CamposFormulario = {
  nombre: string
  ip: string
  puerto: string
}

type ErroresFormulario = {
  nombre: string | null
  ip: string | null
  puerto: string | null
}

function validar(campos: CamposFormulario): ErroresFormulario {
  const errores: ErroresFormulario = { nombre: null, ip: null, puerto: null }

  if (campos.nombre.trim().length === 0) {
    errores.nombre = 'El nombre es obligatorio'
  } else if (campos.nombre.trim().length < 2) {
    errores.nombre = 'El nombre debe tener al menos 2 caracteres'
  } else if (/\s/.test(campos.nombre)) {
    errores.nombre = 'El nombre no puede contener espacios'
  }

  if (campos.ip.trim().length === 0) {
    errores.ip = 'La dirección IP es obligatoria'
  } else if (!REGEX_IPV4.test(campos.ip.trim())) {
    errores.ip = 'Formato inválido (ej. 192.168.1.10)'
  }

  const numeroPuerto = Number(campos.puerto)
  if (campos.puerto.trim().length === 0) {
    errores.puerto = 'El puerto es obligatorio'
  } else if (!Number.isInteger(numeroPuerto) || numeroPuerto < 1 || numeroPuerto > 65535) {
    errores.puerto = 'Puerto inválido (1 – 65 535)'
  }

  return errores
}

function hayErrores(errores: ErroresFormulario): boolean {
  return Object.values(errores).some((e) => e !== null)
}

function CampoConError({
  etiqueta,
  children,
  error,
}: {
  etiqueta: string
  children: React.ReactNode
  error: string | null
}) {
  return (
    <View style={styles.campoWrapper}>
      <Text style={styles.etiqueta}>{etiqueta}</Text>
      {children}
      {error !== null && <Text style={styles.textoError}>{error}</Text>}
    </View>
  )
}

export default function Paso11() {
  const [campos, setCampos] = useState<CamposFormulario>({
    nombre: '',
    ip: '',
    puerto: '22',
  })
  const [errores, setErrores] = useState<ErroresFormulario>({
    nombre: null,
    ip: null,
    puerto: null,
  })
  const [enviado, setEnviado] = useState(false)

  function actualizarCampo(campo: keyof CamposFormulario, valor: string) {
    setCampos((prev) => ({ ...prev, [campo]: valor }))
    if (errores[campo] !== null) {
      setErrores((prev) => ({ ...prev, [campo]: null }))
    }
  }

  function onSubmit() {
    const nuevosErrores = validar(campos)
    setErrores(nuevosErrores)
    if (hayErrores(nuevosErrores)) return

    setEnviado(true)
    Alert.alert(
      'Servidor agregado',
      `${campos.nombre} · ${campos.ip}:${campos.puerto}`,
      [
        {
          text: 'Agregar otro',
          onPress: () => {
            setCampos({ nombre: '', ip: '', puerto: '22' })
            setErrores({ nombre: null, ip: null, puerto: null })
            setEnviado(false)
          },
        },
      ]
    )
  }

  return (
    <SafeAreaView style={styles.contenedor}>
      <ScrollView
        contentContainerStyle={styles.scroll}
        keyboardShouldPersistTaps="handled"
      >
        <Text style={styles.titulo}>Agregar servidor</Text>
        <Text style={styles.subtitulo}>
          Los campos marcados con * son obligatorios
        </Text>

        <CampoConError etiqueta="Nombre del servidor *" error={errores.nombre}>
          <TextInput
            style={[
              styles.campo,
              errores.nombre !== null && styles.campoError,
            ]}
            value={campos.nombre}
            onChangeText={(v) => actualizarCampo('nombre', v)}
            placeholder="ej. web-03"
            autoCapitalize="none"
            autoCorrect={false}
            returnKeyType="next"
          />
        </CampoConError>

        <CampoConError etiqueta="Dirección IP *" error={errores.ip}>
          <TextInput
            style={[
              styles.campo,
              errores.ip !== null && styles.campoError,
            ]}
            value={campos.ip}
            onChangeText={(v) => actualizarCampo('ip', v)}
            placeholder="192.168.1.10"
            keyboardType="numeric"
            returnKeyType="next"
          />
        </CampoConError>

        <CampoConError etiqueta="Puerto *" error={errores.puerto}>
          <TextInput
            style={[
              styles.campo,
              errores.puerto !== null && styles.campoError,
            ]}
            value={campos.puerto}
            onChangeText={(v) => actualizarCampo('puerto', v)}
            placeholder="22"
            keyboardType="number-pad"
            returnKeyType="done"
            onSubmitEditing={onSubmit}
          />
        </CampoConError>

        <Pressable
          style={({ pressed }) => [
            styles.botonEnviar,
            pressed && styles.botonEnviarPresionado,
            enviado && styles.botonEnviarExito,
          ]}
          onPress={onSubmit}
        >
          <Text style={styles.textoBoton}>
            {enviado ? '✓ Enviado' : 'Agregar servidor'}
          </Text>
        </Pressable>
      </ScrollView>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  contenedor: { flex: 1, backgroundColor: '#f0f4f8' },
  scroll: { padding: 20, paddingBottom: 40 },
  titulo: { fontSize: 20, fontWeight: '700', color: '#1565c0', marginBottom: 4 },
  subtitulo: { fontSize: 12, color: '#888', marginBottom: 20 },
  campoWrapper: { marginBottom: 16 },
  etiqueta: { fontSize: 13, fontWeight: '600', color: '#444', marginBottom: 4 },
  campo: {
    backgroundColor: '#fff',
    borderWidth: 1,
    borderColor: '#cfd8dc',
    borderRadius: 8,
    paddingHorizontal: 12,
    paddingVertical: 10,
    fontSize: 15,
    color: '#1a1a1a',
  },
  campoError: {
    borderColor: '#e53935',
    backgroundColor: '#fff8f8',
  },
  textoError: {
    fontSize: 12,
    color: '#e53935',
    marginTop: 4,
  },
  botonEnviar: {
    backgroundColor: '#1565c0',
    borderRadius: 8,
    paddingVertical: 14,
    alignItems: 'center',
    marginTop: 8,
  },
  botonEnviarPresionado: { backgroundColor: '#0d47a1' },
  botonEnviarExito: { backgroundColor: '#2e7d32' },
  textoBoton: { color: '#fff', fontWeight: '700', fontSize: 16 },
})
