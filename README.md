# bingle

Mr. Bingle is a fictional character, a [snowman assistant](https://en.wikipedia.org/wiki/Mr._Bingle) to Santa Claus

<center>
  <img src="./media/mr_bingle.png" width="200">
</center>

## Usage

From any repository:

```sh
../bingle/<script-name>
```

## Template

You can use it to create scripts that accept parameters

Options:

- `-p1` (or `--param1`) to set `PARAM_1` to `true` (`false` by default)
- `-p2` (or `--param2`) to set `PARAM_2` to the next coming value (`""` by default)
- `-h` (or `--help`) show help

```
../bingle/script_template.sh [-p1|--param1] [-p2|--param2 value] | [-h|--help]
```

## Scripts

### Stop/Start mongo replicaset dockers

```sh
sudo ../bingle/stop_start_docker_mongoset.sh [-n|--num-of-replicas value] | [-h|--help]
```
