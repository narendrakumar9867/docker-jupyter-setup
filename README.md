# Setup Documentation & Guide

## 1. Overview

This document covers the complete setup of Jupyter Notebook using Docker. Docker allows us to run Jupyter in isolated container without installing it directly on our machine.

---

## 2. Step-by-Step Setup

### Step 1 — Install Docker and Python

### Step 2 — Create Project Folder

### Step 3 — Create Dockerfile

Write this code inside dockerfile –

```dockerfile
FROM python:3.11-slim
WORKDIR /app
RUN pip install jupyter notebook
EXPOSE 8888
RUN mkdir -p /app/notebooks
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=", "--NotebookApp.password="]
```

### Step 4 — Build Docker Image

Run this command inside the folder where Dockerfile is saved:

```bash
docker build -t jupyter-notebook .
```

### Step 5 — Run the Container

```bash
docker-compose up -d
```

### Step 6 — Open in Browser

Open your browser and go to:

```
http://localhost:8888
```

### Step 7 — Run Sample Notebook

Click 'New' > 'Python 3' to create a new notebook. Run the following code to verify the setup:

```python
pip install numpy matplotlib

import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 10, 100)
y = np.sin(x)

plt.plot(x, y)
plt.title('Sample Graph docker Jupyter')
plt.show()
```

---

## 3. Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| Port already in use | Change `-p 8889:8888` and open `localhost:8889` |
| Container name already exists | Run: `docker rm my-jupyter`, then re-run |
| Packages not found | Add them to Dockerfile `RUN pip install` line and rebuild |