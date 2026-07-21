import { useRef, useState } from 'react'
import {
  Pressable, SafeAreaView, ScrollView, StyleSheet, Text, TextInput, View,
} from 'react-native'

export default function Paso10() {
  const [nombre, setNombre] = useState('')
  const [ip, setIp] = useState('')
  const [puerto, setPuerto] = useState('')
  const [password, setPassword] = useState('')
  const [mostrarPass, setMostrarPass] = useState(false)

  const refIp = useRef<TextInput>(null)
  const refPuerto = useRef<TextInput>(null)
  const refPass = useRef<TextInput>(null)

  return (
    <SafeAreaView style={styles.contenedor}>
      <Text style={styles.titulo}>Configurar acceso SSH</Text>

      <ScrollView contentContainerStyle={styles.scroll}>
        <Text style={styles.etiqueta}>Nombre del servidor</Text>
        <TextInput
          style={styles.campo}
          value={nombre}
          onChangeText={setNombre}
          placeholder="ej. web-03"
          autoCapitalize="none"
          autoCorrect={false}
          returnKeyType="next"
          onSubmitEditing={() => refIp.current?.focus()}
        />

        <Text style={styles.etiqueta}>Dirección IP</Text>
        <TextInput
          ref={refIp}
          style={styles.campo}
          value={ip}
          onChangeText={setIp}
          placeholder="192.168.1.1"
          keyboardType="numeric"
          returnKeyType="next"
          onSubmitEditing={() => refPuerto.current?.focus()}
        />

        <Text style={styles.etiqueta}>Puerto SSH</Text>
        <TextInput
          ref={refPuerto}
          style={styles.campo}
          value={puerto}
          onChangeText={setPuerto}
          placeholder="22"
          keyboardType="number-pad"
          returnKeyType="next"
          onSubmitEditing={() => refPass.current?.focus()}
        />

        <Text style={styles.etiqueta}>Contraseña</Text>
        <View style={styles.campoConIcono}>
          <TextInput
            ref={refPass}
            style={[styles.campo, { flex: 1, marginBottom: 0 }]}
            value={password}
            onChangeText={setPassword}
            placeholder="••••••••"
            secureTextEntry={!mostrarPass}
            returnKeyType="done"
            autoCapitalize="none"
          />
          <Pressable
            onPress={() => setMostrarPass((v) => !v)}
            style={styles.togglePass}
          >
            <Text style={styles.togglePassTexto}>
              {mostrarPass ? 'Ocultar' : 'Ver'}
            </Text>
          </Pressable>
        </View>

        <View style={styles.preview}>
          <Text style={styles.previewTexto}>
            ssh {nombre || '<nombre>'}@{ip || '<ip>'} -p {puerto || '22'}
          </Text>
        </View>
      </ScrollView>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  contenedor: { flex: 1, backgroundColor: '#f0f4f8' },
  titulo: { fontSize: 18, fontWeight: '700', color: '#1565c0', marginBottom: 20, padding: 16 },
  scroll: { padding: 16 },
  etiqueta: { fontSize: 13, fontWeight: '600', color: '#444', marginBottom: 4 },
  campo: {
    backgroundColor: '#fff',
    borderWidth: 1,
    borderColor: '#cfd8dc',
    borderRadius: 8,
    paddingHorizontal: 12,
    paddingVertical: 10,
    fontSize: 15,
    marginBottom: 14,
    color: '#1a1a1a',
  },
  campoConIcono: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    marginBottom: 14,
  },
  togglePass: {
    paddingHorizontal: 12,
    paddingVertical: 10,
    backgroundColor: '#e3f2fd',
    borderRadius: 8,
  },
  togglePassTexto: { fontSize: 13, color: '#1565c0', fontWeight: '600' },
  preview: {
    marginTop: 8,
    backgroundColor: '#1a1a2e',
    borderRadius: 8,
    padding: 12,
  },
  previewTexto: {
    fontFamily: 'monospace',
    fontSize: 13,
    color: '#a8ff78',
  },
})
