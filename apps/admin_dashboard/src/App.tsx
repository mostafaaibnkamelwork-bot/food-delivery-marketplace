import React from 'react';
import { createBrowserRouter, RouterProvider, Link } from 'react-router-dom';

const modules = ['Analytics','Users','Restaurants','Drivers','Orders','Payments','Commissions','Settlements','Coupons','Reports','Support','System Settings'];

function Dashboard() {
  return <main style={{padding: 24}}>
    <h1>Admin Dashboard</h1>
    <div style={{display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(220px, 1fr))', gap: 12}}>
      {modules.map((module) => <Link key={module} to={'/' + module.toLowerCase().replaceAll(' ', '-')} style={{padding: 16, border: '1px solid #ddd', borderRadius: 8}}>{module}</Link>)}
    </div>
  </main>;
}

function ModulePage({title}: {title: string}) {
  return <main style={{padding: 24}}><h1>{title}</h1><p>CRUD table, filters, forms, role checks, and API integration boundary.</p></main>;
}

const router = createBrowserRouter([
  {path: '/', element: <Dashboard />},
  ...modules.map((module) => ({path: '/' + module.toLowerCase().replaceAll(' ', '-'), element: <ModulePage title={module} />})),
]);

export default function App() {
  return <RouterProvider router={router} />;
}
