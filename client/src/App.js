import {useState, useRef} from 'react'
// import logo from './logo.svg';
import './App.css';

function App() {
  
const refTest = useRef()
const [picture, setPicture] = useState(null)

  const handleClick=(e)=>{
    e.preventDefault()
    
    const formy = new FormData()
    formy.append('picture', picture)
    formy.append('caption', "hi Chett!")
    // console.log(formy.getAll('test'))
    
    fetch('/images', {
      method: 'POST',
      body: formy
    })
    .then(r=>r.json)
    .then(d=>console.log(d))

  }

  const [photo, setPhoto] = useState("")
  const checkItOut = () =>{
    fetch("http://localhost:3000/images/12")
    .then(r=>r.json())
    .then(d=>setPhoto(d.pictured.url))
  }

  return (
<>

      <form onSubmit={handleClick}>
    <input type="file" multiple={false} accept="image/*" onChange={(e)=>setPicture(e.target.files[0])} ref = {refTest}/>
     <button>SUBMIT TO ME!</button>
     </form>

    <button onClick={checkItOut}>what's it all about?</button>

    <img alt="test" src={photo} caption="test" />

    </>
    
    
    // <div className="App">
    //   <header className="App-header">
    //     <img src={logo} className="App-logo" alt="logo" />
    //     <p>
    //       Edit <code>src/App.js</code> and save to reload.
    //     </p>
    //     <a
    //       className="App-link"
    //       href="https://reactjs.org"
    //       target="_blank"
    //       rel="noopener noreferrer"
    //     >
    //       Learn React
    //     </a>
    //   </header>
    // </div>
  );
}

export default App;
