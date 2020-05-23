import React, { useState } from 'react'
import './styles.css'
// import logoImg from '../../assets/logo.svg'
import { Link, useHistory } from 'react-router-dom'
import { FiArrowLeft } from 'react-icons/fi'
import api from '../../services/api'

export default function NewIncident() {
  const history = useHistory()
  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const entityId = localStorage.getItem('entityId')

  async function handleNewincident(e) {
    e.preventDefault()

    const data = {
      title,
      description
    }

    try {
      await api.post('incidents', data, {
        headers: {
          Authorization: entityId
        }
      })

      history.push('/profile')
    } catch (error) {
      alert('Falha ao cadastrar doação, tente novamente.')
    }
  }
  return (
    <div className="new-incident-container">
      <div className="content">
        <section>
          {/* <img src={logoImg} alt="Logo Be The Hero" /> */}
          <h1>Cadastro de um novo produto para doação</h1>
          <p align="justify">Descreva detalhadamente informações sobre seu produto para que as pessoas possam encontrar sua doação.</p>
          <Link className="back-link" to="/profile">
            <FiArrowLeft size={20} /> Voltar para o painel
          </Link>
        </section>

        <form onSubmit={handleNewincident}>
          <input
            placeholder="Título da doação"
            value={title}
            onChange={e => setTitle(e.target.value)}
          />
          <textarea
            placeholder="Descrição do produto"
            value={description}
            onChange={e => setDescription(e.target.value)}
          />
          <button className="button" type="submit" >Cadastrar</button>
        </form>
      </div>
    </div>
  )

}