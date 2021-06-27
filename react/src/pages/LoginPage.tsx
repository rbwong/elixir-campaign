import React, { useState, useEffect } from "react"
import { useHistory } from "react-router-dom"
import styled from "@emotion/styled"
import Cookies from "js-cookie"
import { toast, ToastContainer } from "react-toastify"

// Data
import { loginApi } from "data/authentication/api"
import { baseColors, fontColors } from "constants/colors"

// Components
import Button from "components/Buttons/Button"
import Input from "components/Fields/Input"
import logo from "icons/logo.svg"
import "react-toastify/dist/ReactToastify.css"

const Container = styled.div`
  align-items: center;
  display: flex;
  flex-direction: column;
  height: 100%;
  justify-content: center;
  position: absolute;
  width: 100%;
`

const CardContent = styled.div`
  align-items: center;
  background-color: ${baseColors.transluscent};
  border-radius: 3px;
  color: ${fontColors.white};
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 40px 50px;
  width: 350px;
`

const Heading = styled.div`
  color: ${fontColors.gray};
  font-size: 20px;
  margin: 20px 0;
`

const Logo = styled.img`
  height: 60px;
  width: auto;
`

const InputContainer = styled.div`
  margin-bottom: 20px;
  width: 100%;
`

const Label = styled.div`
  color: ${fontColors.gray};
  margin-bottom: 5px;
`

function LoginPage() {
  const history = useHistory()
  const [email, setEmail] = useState("")
  const [password, setPassword] = useState("")
  const isAuthenticated = Cookies.get("ecToken")

  useEffect(() => {
    if (!isAuthenticated) {
      return
    }
    history.push("/")
  })

  const loginUser = () => {
    loginApi(
      { session: { email, password } },
      (data) => {
        if (data) {
          Cookies.set("ecToken", data.data.token)
          setEmail("")
          setPassword("")
          history.push("/")
        }
      },
      () => {
        toast.error("Invalid username or password.")
      }
    )
  }

  return (
    <Container>
      <CardContent>
        <ToastContainer />
        <Logo alt='logo' src={logo} />
        <Heading>Brand Campaign</Heading>
        <InputContainer>
          <Label>Email</Label>

          <Input
            type='email'
            value={email}
            onChange={(event) => setEmail(event.currentTarget.value)}
          />
        </InputContainer>
        <InputContainer>
          <Label>Password</Label>
          <Input
            type='password'
            value={password}
            onChange={(event) => setPassword(event.currentTarget.value)}
          />
        </InputContainer>
        <Button onClick={loginUser}>Login</Button>
      </CardContent>
    </Container>
  )
}

export default LoginPage
