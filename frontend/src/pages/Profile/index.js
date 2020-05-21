import React, { useState, useEffect } from 'react'
import './styles.css'
import { Link, useHistory } from 'react-router-dom'
import { FiPower, FiTrash2 } from 'react-icons/fi'

// import logoImg from '../../assets/logo.svg'

import api from '../../services/api'

export default function Profile() {
  const history = useHistory()
  const [incidents, setIncidents] = useState([])

  const entityName = localStorage.getItem('entityName')
  const entityId = localStorage.getItem('entityId')

  useEffect(() => {
    api.get('profile', {
      headers: {
        Authorization: entityId,
      }
    }).then(response => {
      setIncidents(response.data.incidents)
    })
  }, [entityId])

  async function handleDeleteIncident(id) {
    try {
      await api.delete(`incidents/${id}`, {
        headers: {
          Authorization: entityId,
        }
      })

      setIncidents(incidents.filter(incident => incident.id !== id))

    } catch (error) {
      alert('Falha ao deletar doação, tente novamente.')
    }
  }

  function handleLogout() {
    localStorage.clear()
    history.push('/')
  }

  return (
    <div className="profile-container">
      <header>
        {/* <img src={logoImg} alt="Logo Be The Hero" /> */}
        <span>Bem vinda {entityName}, este é o seu painel de doações.</span>
        <Link className="button" to="/incidents/new">Cadastrar nova doação</Link>
        <button onClick={handleLogout} type="button">
          <FiPower size={18} color="#E02041" />
        </button>
      </header>

      <h1>Doações cadastradas</h1>

      <ul>
        {incidents.map(incident => (
          <li key={incident.id}>
            <strong>DOAÇÃO:</strong>
            <p>{incident.title}</p>

            <strong>DESCRIÇÃO</strong>
            <p>{incident.description}</p>

            <button onClick={() => handleDeleteIncident(incident.id)} type="button">
              <FiTrash2 size={20} color="red" />
            </button>
          </li>
        ))}
      </ul>
    </div>
  )
}